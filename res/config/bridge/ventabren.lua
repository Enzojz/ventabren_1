local bridgeutil = require "bridgeutil"

local path = "bridge/ventabren/"

local config = {
    pillarBase = {
		path .. "lgv_pillar_btm.mdl",
		path .. "lgv_pillar_btm.mdl",
		path .. "lgv_pillar_btm.mdl"
	},
    pillarRepeat = {
		path .. "lgv_pillar_btm.mdl",
		path .. "lgv_pillar_btm.mdl",
		path .. "lgv_pillar_btm.mdl"
	},
    pillarTop = {
		path .. "lgv_pillar_top.mdl",
		path .. "lgv_pillar_top.mdl",
		path .. "lgv_pillar_top.mdl"
	},
    
    railingBegin = {
		path .. "lgv_railing_rep_side.mdl", 
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_rep.mdl",
		path .. "lgv_railing_rep_rep.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
	},
    railingRepeat = {
		path .. "lgv_railing_rep_side.mdl", 
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_rep.mdl",
		path .. "lgv_railing_rep_rep.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
	},
    railingEnd = {
		path .. "lgv_railing_rep_side.mdl", 
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_rep.mdl",
		path .. "lgv_railing_rep_rep.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
		path .. "lgv_railing_rep_side.mdl",
	},
}

function data()
    return {
        name = _("Ventabren Viaduct"),
        
        yearFrom = 1990,
        yearTo = 0,
        
        carriers = {"RAIL"},
        
        
        speedLimit = 100,
        
        pillarLen = 3,
        
        pillarMinDist = 18.0,
        pillarMaxDist = 66.0,
        pillarTargetDist = 36.0,
        
        cost = 540.0,
        materialsToReplace = {
            streetPaving = {
                name = "street/country_new_medium_paving.mtl",
            },
            streetLane = {
                name = "street/new_medium_lane.mtl",
            },
            crossingLane = {
                name = "street/new_medium_lane.mtl",
            },
            sidewalkPaving = {
                name = "street/new_medium_sidewalk.mtl",
            },
            sidewalkBorderInner = {
                name = "street/new_medium_sidewalk_border_inner.mtl",
                size = {3, 0.6}
            },
        },
        
        updateFn = bridgeutil.makeDefaultUpdateFn(config),
    }
end
