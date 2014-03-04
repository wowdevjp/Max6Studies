--[[
	LuaStudy.lua
]]--

this.autowatch = 1
width = this.dest_dim[1]
height = this.dest_dim[2]

-- load in the OpenGL module
local gl = require("opengl")
local GL = gl

-- matrix
shape = jit.matrix("shape")

-- Functions
function ortho()
	gl.MatrixMode(GL.PROJECTION)
	gl.LoadIdentity()
	gl.Ortho(-1.0, 1.0, -1.0, 1.0, -10.0, 10.0)
	gl.MatrixMode(GL.MODELVIEW)
end

-- draw
function toArray(...)
	local arg = {...}
	return arg
end

function drawGridshape()

	local xsize = shape.dim[1] - 1
	local ysize = shape.dim[2] - 1
	
	gl.Begin(GL.POINTS)	
	for y = 0, ysize, 1 do
		for x = 0, xsize, 1 do
			local pos = toArray(shape:getcell(x,y))
			gl.Vertex(pos[1], pos[2], pos[3])
		end
	end
	gl.End()
end

function draw()
	--ortho()	
	gl.Color(1.0,1.0,1.0,1.0)
	gl.PointSize(2)
	drawGridshape()
	--gl.Flush()	
end
