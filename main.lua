-- create 2 parts called 'PointA' and 'PointB'
local pointA = game.Workspace:WaitForChild("PointA")
local pointB = game.Workspace:WaitForChild("PointB")

while wait() do
	local path = game:GetService("PathfindingService"):ComputeRawPathAsync(pointA.Position,pointB.Position,500)
	local pathCoordinates = path:GetPointCoordinates()
	
	-- create a folder called 'Points' in the Workspace
	local points = game.Workspace:WaitForChild("Points")

	points:ClearAllChildren()
	
	for pointIndex = 1, #pathCoordinates do
		print(pathCoordinates[pointIndex])
	end
	
	for pointIndex = 1, #pathCoordinates do
		local point = Instance.new("Part")
		point.Anchored = true
		point.Size = Vector3.new(1,1,1)
		point.Position = pathCoordinates[pointIndex]
		point.Parent = points
	end
end

