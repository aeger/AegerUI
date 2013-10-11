local addonname, aegerUI = ...

function aegerUI:InstalloUF_MovableFrames()
	if not IsAddOnLoaded("oUF_MovableFrames") then return end
	
		_G.aegerUI_oUF_MovableFrames_Install = {
		["__INITIAL"] = {
		["karma"] = {
			["oUF_karmaFocusTarget"] = "BOTTOMUIParent2773081.000",
			["oUF_karmaTargetTarget"] = "BOTTOMRIGHTUIParent-4933081.000",
			["oUF_karmaFocus"] = "BOTTOMLEFTUIParent3522441.000",
			["oUF_karmaTarget"] = "CENTERUIParent280-791.000",
			["oUF_karmaPlayer"] = "CENTERUIParent0-1791.000",
		},
		["oUF_karmaBoss"] = {
			["oUF_Boss2"] = "TOPRIGHTUIParent-9-2701.000",
			["oUF_Boss4"] = "RIGHTUIParent-91141.000",
			["oUF_Boss1"] = "TOPRIGHTUIParent-9-2001.000",
			["oUF_Boss3"] = "TOPRIGHTUIParent-9-3401.000",
		},
	},
	["oUF_karmaBoss"] = {
		["oUF_Boss2"] = "TOPLEFTUIParent39-701.000",
		["oUF_Boss4"] = "TOPLEFTUIParent43-1611.000",
		["oUF_Boss1"] = "TOPLEFTUIParent40-271.000",
		["oUF_Boss3"] = "TOPLEFTUIParent41-1161.000",
	},
	["karma"] = {
		["oUF_karmaFocusTarget"] = "CENTERUIParent450-1671.000",
		["oUF_karmaTargetTarget"] = "RIGHTUIParent-447-2131.000",
		["oUF_karmaFocus"] = "BOTTOMLEFTUIParent2922251.000",
		["oUF_karmaTarget"] = "CENTERUIParent342-2541.000",
		["oUF_karmaPlayer"] = "CENTERUIParent-342-2541.000",
	},
		}
		
for k,v in pairs(aegerUI_oUF_MovableFrames_Install) do
		bb08df87101dd7f2161e5b77cf750f753c58ef1b[k] = v
	end
end