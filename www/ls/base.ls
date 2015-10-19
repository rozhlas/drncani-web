container = d3.select ig.containers.base
height = 980
kilometers = height / 50
class Ramp
  (@name, @km, @dir = "both", @shape = "both", @special)->

class GasStation
  (@name, @km, @dir = "both", @shape = "both", @special)->
ramps =
  new Ramp "Chodov", 0.5, "brno", "on"
  new Ramp "Chodov", 2
  new Ramp "Průhonice", 6.2, "brno"
  new Ramp "Průhonice", 6.6, "praha"
  new Ramp "Modletice", 9.7, "brno", "both", "R1"
  new Ramp "Modletice", 11.7, "praha", "both", "R1"
  new Ramp "Všechromy", 15.6
# console.log kilometers / height * 1000
gasStations =
  new GasStation "Újezd", 4.5 # benzinka
  new GasStation "Újezd", 4.5 # benzinka
canvas = container.append \canvas
  ..attr \width 250
  ..attr \height height

ctx = canvas.node!getContext \2d
highway = new ig.Highway ctx, height, kilometers
  ..addGrass 0
  ..addLane 1
  ..addDelim 1, "full"
  ..addLane 2
  ..addLane 3
  ..addDelim 2, "dash"
  ..addDelim 3, "dash"
  ..addGrass 4
  ..addGuardrail 4
  ..addDelim 4, "full"
  ..addLane 5
  ..addDelim 5, "full"
  ..addLane 6
  ..addLane 7
  ..addDelim 6, "dash"
  ..addDelim 7, "dash"
  ..addGrass 8
  ..addDelim 8, "full"

for ramp in ramps
  if ramp.dir in <[praha both]>
    highway.addRamp 8, ramp
  if ramp.dir in <[brno both]>
    highway.addRamp 0, ramp
  # console.log ramp

for gasStation in gasStations
  if gasStation.dir in <[praha both]>
    highway.addGasStation 8, gasStation
  if gasStation.dir in <[brno both]>
    highway.addGasStation 0, gasStation
  # console.log ramp
