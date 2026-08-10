set proj_name   "riscv_pipeline"
set proj_dir    "./vivado_project"
set part_name   "xc7a100tcsg324-1"

if {[file exists $proj_dir]} {
    file delete -force $proj_dir
}

create_project $proj_name $proj_dir -part $part_name

# --- Helper: only call add_files if the glob actually found files ---
proc add_files_safe {pattern {fileset ""}} {
    set files [glob -nocomplain $pattern]
    if {[llength $files] > 0} {
        if {$fileset eq ""} {
            add_files -norecurse $files
        } else {
            add_files -fileset $fileset -norecurse $files
        }
    } else {
        puts "WARNING: no files found matching '$pattern' — skipping"
    }
}

# --- Add RTL source files ---
add_files_safe "./rtl/core/*.v"
add_files_safe "./rtl/components/*.v"
add_files_safe "./rtl/memory/*.v"
add_files_safe "./rtl/accel/*.v"

# --- Add simulation-only sources ---
add_files_safe "./tb/*.v" sim_1

# --- Add constraints ---
if {[file exists ./constraints/top.xdc]} {
    add_files -fileset constrs_1 -norecurse ./constraints/top.xdc
}

# --- Set top modules (only if the files actually exist — see note below) ---
catch {set_property top riscv_core_top [current_fileset]}
catch {set_property top tb_riscv_core_top [get_filesets sim_1]}

update_compile_order -fileset sources_1
catch {update_compile_order -fileset sim_1}

puts "Project '$proj_name' created successfully at $proj_dir"
