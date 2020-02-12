function data()
    return {
        name = _("Ventabren Viaduct"),
        
        yearFrom = 1990,
        yearTo = 0,
        
        carriers = {"RAIL"},
        
        speedLimit = 100,
        
        pillarLen = 3,
        
        pillarMinDist = 45.0,
        pillarMaxDist = 66.0,
        pillarTargetDist = 50.0,
        
        cost = 540.0,
        
        updateFn = function(params)
            local result = {
                railingModels = {},
                pillarModels = {}
            }
            
            for i, height in ipairs(params.pillarHeights) do
                local colHeight = height - 10.2
                local nSeg = math.ceil(colHeight / 6)
                
                local rs = {
                    {
                        {
                            id = "bridge/ventabren/pillar_top.mdl",
                            transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, height, 1}
                        }
                    }
                }
                
                for s = 1, nSeg do
                    table.insert(
                        rs,
                        {
                            {
                                id = "bridge/ventabren/pillar_btm.mdl",
                                transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, -10.2 - (s - 1) * 6 + height, 1}
                            }
                        }
                )
                end
                
                table.insert(result.pillarModels, rs)
            
            end
            
            for i, interval in ipairs(params.railingIntervals) do
                local nSeg = math.floor((interval.length) / 6)
                if nSeg < 1 then nSeg = 1 end
                local lSeg = interval.length / nSeg
                local xScale = lSeg / 5.8
                
                local minOffset = interval.lanes[1].offset
                local maxOffset = interval.lanes[#interval.lanes].offset
                
                local width = maxOffset - minOffset
                local nPart = math.floor(width / 5)
                local wPart = width / nPart
                local yScale = wPart / 5
                
                local set = function(n)
                    local partName = n == 1 and "start" or (n == nSeg and "end" or "start")
                    local x = (n - 1) * lSeg
                    local set = {
                        {
                            id = "bridge/ventabren/railing_" .. partName .. "_side.mdl",
                            transf = {xScale, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, x, minOffset - 2, 0, 1}
                        },
                        {
                            id = "bridge/ventabren/railing_" .. partName .. "_side_2.mdl",
                            transf = {xScale, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, x, maxOffset + 2, 0, 1}
                        }
                    }
                    
                    for k = 1, nPart do
                        table.insert(set,
                            {
                                id = "bridge/ventabren/railing_" .. partName .. "_rep.mdl",
                                transf = {xScale, 0, 0, 0, 0, yScale, 0, 0, 0, 0, 1, 0, x, minOffset + (k - 1) * wPart, 0, 1}
                            }
                    )
                    end
                    
                    return set
                end
                
                local rs = {}
                for s = 1, nSeg do
                    table.insert(rs, set(s))
                end
                table.insert(result.railingModels, rs)
            end
            
            return result
        end
    }
end
