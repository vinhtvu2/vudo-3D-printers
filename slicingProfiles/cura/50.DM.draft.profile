_description: Slicing profile optimized to print quickly.
_display_name: Draft Quality .50
bottom_layer_speed: 10
bottom_thickness: 0.25
brim_line_count: 20
cool_head_lift: false
cool_min_feedrate: 10
cool_min_layer_time: 5
end_gcode:
- '

  M104 S0             ;extruder heater off

  M140 S0             ;heated bed heater off (if you have it)

  G91                 ;relative positioning

  G1 E-1 F300         ;retract the filament a bit before lifting the nozzle, to release some of the pressure

  G1 Z+0.5 E-5 X-20 Y-20 F{travel_speed} ;move Z up a bit and retract filament even more

  G28                 ;move X/Y to min endstops, so the head is out of the way

  M84                 ;steppers off

  G90                 ;absolute positioning

  ;{profile_string}'
- ';End GCode
  M104 T0 S0           ;extruder heater off
  M104 T1 S0           ;extruder heater off
  M140 S0              ;heated bed heater off (if you have it)
  G91                  ;relative positioning
  G1 E-1 F300          ;retract the filament a bit before lifting the nozzle, to release some of the pressure
  G1 Z+0.5 E-5 X-20 Y-20 F{travel_speed} ;move Z up a bit and retract filament even more
  G28 X0 Y0            ;move X/Y to min endstops, so the head is
  out of the way
  M84                  ;steppers off
  G90                  ;absolute positioning
  ;{profile_string}
  '
- ';End GCode
  M104 T0 S0           ;extruder heater off
  M104 T1 S0           ;extruder heater off
  M104 T2 S0           ;extruder heater off
  M140 S0              ;heated bed heater off (if you have it)
  G91                  ;relative positioning
  G1 E-1 F300          ;retract the filament a bit before lifting
  the nozzle, to release some of the pressure
  G1 Z+0.5 E-5 X-20 Y-20 F{travel_speed} ;move Z up a bit and retract filament even more
  G28 X0 Y0            ;move X/Y to min endstops, so the head is out of the way
  M84                  ;steppers off
  G90                  ;absolute positioning
  ;{profile_string}
  '
- ';End GCode
  M104 T0 S0           ;extruder heater off
  M104 T1 S0           ;extruder heater off
  M104 T2 S0           ;extruder heater off
  M104 T3 S0           ;extruder heater off
  M140 S0              ;heated bed heater off (if you have it)
  G91                  ;relative positioning
  G1 E-1 F300          ;retract the filament a bit before lifting the nozzle, to release some of the pressure
  G1 Z+0.5 E-5 X-20 Y-20 F{travel_speed} ;move Z up a bit and retract filament even more
  G28 X0 Y0                              ;move X/Y to min endstops, so the head is out of the way
  M84                         ;steppers off
  G90                         ;absolute positioning
  ;{profile_string}
  '
fan_enabled: true
fan_full_height: 0.5
fan_speed: 100
fan_speed_max: 100
filament_diameter:
- 1.75
- false
- false
- false
filament_flow: 100.0
fill_density: 10
fill_overlap: 15
first_layer_width_factor: 100
fix_horrible_extensive_stitching: false
fix_horrible_union_all_type_a: true
fix_horrible_union_all_type_b: false
fix_horrible_use_open_bits: false
follow_surface: false
infill_speed: 0.0
inner_shell_speed: 0.0
layer_height: 0.25
object_sink: 0.0
ooze_shield: false
outer_shell_speed: 0.0
overlap_dual: 0.15
platform_adhesion: none
print_bed_temperature: false
print_speed: 100
print_temperature:
- 230
- false
- false
- false
raft_airgap: 0.22
raft_base_linewidth: 1.0
raft_base_thickness: 0.3
raft_interface_linewidth: 0.4
raft_interface_thickness: 0.27
raft_line_spacing: 3.0
raft_margin: 5.0
raft_surface_layers: 2
retraction_amount: 8
retraction_combing: true
retraction_dual_amount: 16.5
retraction_enable: true
retraction_hop: 2.0
retraction_min_travel: 2
retraction_minimal_extrusion: 0.05
retraction_speed: 150
skirt_gap: 3.0
skirt_line_count: 2
skirt_minimal_length: 150.0
solid_bottom: true
solid_layer_thickness: 1.0
solid_top: true
spiralize: false
start_gcode:
- '

  ;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}

  ;Print time: {print_time}

  ;Filament used: {filament_amount}m {filament_weight}g

  ;Filament cost: {filament_cost}

  ;M190 S{print_bed_temperature} ;Uncomment to add your own bed temperature line

  M104 S{print_temperature}  ; set the temperature

  G21        ;metric values

  G90        ;absolute positioning

  G28

  M109 S{print_temperature} ; wait for temperature

  G28		;home again in case motors turned off during warmup

  G1 Z30 F{travel_speed}

  G92 E0                  ;zero the extruded length

  G1 F200 E3              ;extrude 3mm of feed stock

  G92 E0                  ;zero the extruded length again

  G1 F{travel_speed}

  ;Put printing message on LCD screen

  M117 Printing...'
- ';Sliced at: {day} {date} {time}
  ;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}
  ;M190 S{print_bed_temperature} ;Uncomment to add your own bed temperature line
  ;M104 S{print_temperature} ;Uncomment to add your own temperature line
  ;M109 T1 S{print_temperature2} ;Uncomment to add your own temperature line
  ;M109 T0 S{print_temperature} ;Uncomment to add your own temperature line
  G21        ;metric values
  G90        ;absolute positioning
  M107       ;start with the fan off
  G28 X0 Y0  ;move X/Y to min endstops
  G28 Z0     ;move Z to min endstops
  G1 Z15.0 F{travel_speed} ;move the platform down 15mm
  T1                      ;Switch to the 2nd extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F200 E-{retraction_dual_amount}
  T0                      ;Switch to the first extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F{travel_speed}
  ;Put printing message on LCD screen
  M117 Printing...
  '
- ';Sliced at: {day} {date} {time}
  ;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}
  ;M190 S{print_bed_temperature} ;Uncomment to add your own bed temperature line
  ;M104 S{print_temperature} ;Uncomment to add your own temperature line
  ;M109 T2 S{print_temperature2} ;Uncomment to add your own temperature line
  ;M109 T1 S{print_temperature2} ;Uncomment to add your own temperature line
  ;M109 T0 S{print_temperature} ;Uncomment to add your own temperature line
  G21        ;metric values
  G90        ;absolute positioning
  M107       ;start with the fan off
  G28 X0 Y0  ;move X/Y to min endstops
  G28 Z0     ;move Z to min endstops
  G1 Z15.0 F{travel_speed} ;move the platform down 15mm
  T2                      ;Switch to the 3rd extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F200 E-{retraction_dual_amount}
  T1                      ;Switch to the 2nd extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F200 E-{retraction_dual_amount}
  T0                      ;Switch to the first extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F{travel_speed}
  ;Put printing message on LCD screen
  M117 Printing...
  '
- ';Sliced at: {day} {date} {time}
  ;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}
  ;M190 S{print_bed_temperature} ;Uncomment to add your own bed temperature line
  ;M104 S{print_temperature} ;Uncomment to add your own temperature line
  ;M109 T3 S{print_temperature2} ;Uncomment to add your own temperature line
  ;M109 T2 S{print_temperature2} ;Uncomment to add your own temperature line
  ;M109 T1 S{print_temperature2} ;Uncomment to add your own temperature line
  ;M109 T0 S{print_temperature} ;Uncomment to add your own temperature line
  G21        ;metric values
  G90        ;absolute positioning
  M107       ;start with the fan off
  G28 X0 Y0  ;move X/Y to min endstops
  G28 Z0     ;move Z to min endstops
  G1 Z15.0 F{travel_speed} ;move the platform down 15mm
  T3                      ;Switch to the 4th extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F200 E-{retraction_dual_amount}
  T2                      ;Switch to the 3th extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F200 E-{retraction_dual_amount}
  T1                      ;Switch to the 2nd extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F200 E-{retraction_dual_amount}
  T0                      ;Switch to the first extruder
  G92 E0                  ;zero the extruded length
  G1 F200 E10             ;extrude 10mm of feed stock
  G92 E0                  ;zero the extruded length again
  G1 F{travel_speed}
  ;Put printing message on LCD screen
  M117 Printing...
  '
support: none
support_angle: 60
support_dual_extrusion: both
support_fill_rate: 15
support_type: grid
support_xy_distance: 0.7
support_z_distance: 0.15
travel_speed: 120.0
wall_thickness: 1.0
wipe_tower: false
wipe_tower_volume: 15
