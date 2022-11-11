-- Decompiled with the Synapse X Luau decompiler.

return (function(p1, p2, p3, p4, p5, p6, p7)
	local l__char__1 = p6.char;
	if not table.getn then

	end;
	local v2 = {};
	for v3 = 0, 255 do
		v2[v3] = l__char__1(v3);
	end;
	local l__sub__1 = p6.sub;
	local l__table_concat__2 = table.concat;
	if bit or bit32 then
		local v4 = (bit or bit32).bxor or function(p8, p9)
			local v5 = 1;
			local v6 = 0;
			while p8 > 0 and p9 > 0 do
				local v7 = p8 % 2;
				local v8 = p9 % 2;
				if v7 ~= v8 then
					v6 = v6 + v5;
				end;
				p8 = (p8 - v7) / 2;
				p9 = (p9 - v8) / 2;
				v5 = v5 * 2;			
			end;
			if p8 < p9 then
				p8 = p9;
			end;
			while p8 > 0 do
				local v9 = p8 % 2;
				if v9 > 0 then
					v6 = v6 + v5;
				end;
				p8 = (p8 - v9) / 2;
				v5 = v5 * 2;			
			end;
			return v6;
		end;
	else
		v4 = function(p8, p9)
			v5 = 1;
			v6 = 0;
			while p8 > 0 and p9 > 0 do
				v7 = p8 % 2;
				v8 = p9 % 2;
				if v7 ~= v8 then
					v6 = v6 + v5;
				end;
				p8 = (p8 - v7) / 2;
				p9 = (p9 - v8) / 2;
				v5 = v5 * 2;			
			end;
			if p8 < p9 then
				p8 = p9;
			end;
			while p8 > 0 do
				v9 = p8 % 2;
				if v9 > 0 then
					v6 = v6 + v5;
				end;
				p8 = (p8 - v9) / 2;
				v5 = v5 * 2;			
			end;
			return v6;
		end;
	end;
	local l__byte__3 = p6.byte;
	local u4 = (function(p10)
		local v10 = {};
		local v11 = 256;
		local u5 = 1;
		local function v12()
			local v13 = p4(l__sub__1(p10, u5, u5), 36);
			u5 = u5 + 1;
			local v14 = p4(l__sub__1(p10, u5, u5 + v13 - 1), 36);
			u5 = u5 + v13;
			return v14;
		end;
		local v15 = l__char__1(v12());
		v10[1] = v15;
		while u5 < #p10 do
			local v16 = v12();
			if v2[v16] then
				local v17 = v2[v16];
			else
				v17 = v15 .. l__sub__1(v15, 1, 1);
			end;
			v2[v11] = v15 .. l__sub__1(v17, 1, 1);
			v15 = v17;
			v11 = v11 + 1;
			v10[#v10 + 1] = v17;		
		end;
		return l__table_concat__2(v10);
	end)("23W23W23X27623Y27627923X23H24Y23Z27924F27E27927527927827I27924D23X21D21H21D22U21D21I22R22R21L21E21L21I21I22P22T21C27A23X");
	local u6 = 1;
	local l__select__7 = select;
	local function u8()
		local v18 = v4(l__byte__3(u4, u6, u6), 141);
		u6 = u6 + 1;
		return v18;
	end;
	local function u9()
		local v19, v20 = l__byte__3(u4, u6, u6 + 2);
		local v21 = v4(v19, 141);
		local v22 = v4(v20, 141);
		u6 = u6 + 2;
		return v22 * 256 + v21;
	end;
	local function u10()
		local v23, v24, v25, v26 = l__byte__3(u4, u6, u6 + 3);
		local v27 = v4(v23, 141);
		local v28 = v4(v24, 141);
		local v29 = v4(v25, 141);
		local v30 = v4(v26, 141);
		u6 = u6 + p5;
		return v30 * p1 + v29 * p3 + v28 * 256 + v27;
	end;
	local function u11(p11, p12, p13)
		if not p13 then
			local v31 = 2 ^ (p12 - 1);
			if v31 <= p11 % (v31 + v31) then
				return 1;
			else
				return 0;
			end;
		end;
		local v32 = p11 / 2 ^ (p12 - 1) % 2 ^ (p13 - 1 - (p12 - 1) + 1);
		return v32 - v32 % 1;
	end;
	local l__table_insert__12 = table.insert;
	local u13 = 0;
	local function u14()
		local v33 = {};
		local v34 = {};
		local v35 = {
			[7] = v34, 
			[8] = {}, 
			[2] = nil, 
			[p5] = {}, 
			[p2] = nil, 
			[6] = v33
		};
		local v36 = {};
		local v37 = {};
		for v38 = 1, u8() == 0 and u9() * 2 or u10() do
			local v39 = u8();
			if v39 == 2 then
				local v40 = u8() ~= 0;
			elseif v39 == 3 then
				local v41 = nil;
				local v42 = nil;
				local v43 = nil;
				local v44 = nil;
				local v45 = nil;
				local v46 = nil;
				local v47 = nil;
				local v48 = nil;
				local v49 = nil;
				local v50 = nil;
				local v51 = nil;
				local v52 = nil;
				local v53 = nil;
				local v54 = nil;
				local v55 = nil;
				local v56 = nil;
				local v57 = nil;
				local v58 = u10();
				local v59 = 1;
				local v60 = u11(v58, 1, 20) * 4294967296 + u10();
				local v61 = u11(v58, 21, 31);
				local v62 = (-1) ^ u11(v58, 32);
				if v61 == 0 then
					if v60 == 0 then
						v40 = v62 * 0;
					else
						v61 = 1;
						v59 = 0;
						v44 = 2;
						v41 = 1023;
						v42 = v61;
						v43 = v41;
						v45 = v42 - v43;
						v46 = v44;
						v47 = v45;
						v48 = v46 ^ v47;
						v49 = v62;
						v50 = v48;
						v55 = v49 * v50;
						local v63 = 4503599627370496;
						v51 = v60;
						v52 = v63;
						local v64 = v51 / v52;
						v53 = v59;
						v54 = v64;
						local v65 = v53 + v54;
						v56 = v55;
						v57 = v65;
						v40 = v56 * v57;
					end;
				elseif v61 == 2047 then
					if v60 == 0 then
						local v66 = 1;
					else
						v66 = 0;
					end;
					v40 = v62 * (v66 / 0);
				else
					v44 = 2;
					v41 = 1023;
					v42 = v61;
					v43 = v41;
					v45 = v42 - v43;
					v46 = v44;
					v47 = v45;
					v48 = v46 ^ v47;
					v49 = v62;
					v50 = v48;
					v55 = v49 * v50;
					v63 = 4503599627370496;
					v51 = v60;
					v52 = v63;
					v64 = v51 / v52;
					v53 = v59;
					v54 = v64;
					v65 = v53 + v54;
					v56 = v55;
					v57 = v65;
					v40 = v56 * v57;
				end;
			elseif v39 == 0 then
				local v67 = "";
				local v68, v69 = u10();
				if v68 == 0 then
					v40 = v67;
				else
					local v70 = l__sub__1(u4, u6, u6 + v68 - 1);
					local v71 = { l__byte__3(v70, 1, #v70) };
					u6 = u6 + v68;
					for v72 = 1, #v71 do
						v67 = v67 .. v2[v4(v71[v72], 141)];
					end;
					v40 = local v73;
				end;
			elseif v39 == p5 then
				local v74 = u10();
				v40 = l__sub__1(u4, u6, u6 + v74 - 1);
				u6 = u6 + v74;
			elseif v39 == p5 then
				local v75 = u10();
				v40 = l__sub__1(u4, u6, u6 + v75 - 1);
				u6 = u6 + v75;
			else
				v40 = nil;
			end;
			v37[v38] = v40;
		end;
		for v76 = 1, u10() do
			local v77 = u8();
			if u11(v77, 1, 1) == 0 then
				local v78 = u11(v77, 2, 3);
				local v79 = u11(v77, p5, 6);
				local v80 = u8() == 1;
				local v81 = {};
				local v82 = {};
				local v83 = {
					[3] = u9(), 
					[p2] = nil, 
					[6] = v80, 
					[8] = u9()
				};
				if v78 == 3 then
					v83[6] = u10() - p3;
					v83[p2] = u9();
				end;
				if v78 == 0 then
					v83[6] = u9();
					v83[p2] = u9();
				end;
				if v78 == 1 then
					v83[6] = u10();
				end;
				if v78 == 2 then
					v83[6] = u10() - p3;
				end;
				if u11(v79, 2, 2) == 1 then
					v81[6] = 6;
					v83[6] = v37[v83[6]];
				end;
				if u11(v79, 3, 3) == 1 then
					v81[p2] = p2;
					v83[p2] = v37[v83[p2]];
				end;
				if u11(v79, 1, 1) == 1 then
					v81[8] = 8;
					v83[8] = v37[v83[8]];
				end;
				if v80 then
					l__table_insert__12(v35[8], v83);
					v83[1] = v81;
				end;
				v34[v76] = v83;
			end;
		end;
		if u13 < 1 then
			u13 = 1;
			local v84 = u9();
			v35[9] = l__sub__1(u4, u6, u6 + v84 - 1);
			u6 = u6 + v84;
		end;
		for v85 = 1, u10() do
			v33[v85 - 1] = u14();
		end;
		v35[p2] = u8();
		return v35;
	end;
	local function u15(...)
		return { ... }, l__select__7("#", ...);
	end;
	return (unpack or table.unpack)({ (function(p14, p15, p16, p17)
			local v86 = p14[2];
			local v87 = p14[8];
			local u16 = p14[6];
			local u17 = p14[7];
			local u18 = p14[p2];
			return function(...)
				local v88 = {};
				local v89 = {};
				local v90 = 1;
				local v91 = {};
				local v92 = { ... };
				for v93 = 0, l__select__7("#", ...) - 1 do
					if u18 <= v93 then
						v91[v93 - u18] = v92[v93 + 1];
					else
						v88[v93] = v92[v93 + 1];
					end;
				end;
				while true do
					local v94 = u17[v90];
					local v95 = v94[3];
					if v95 <= 1 then
						if v95 == 0 then
							return;
						end;
						v88[v94[8]] = v94[6];
					else
						if v95 ~= 2 then
							break;
						end;
						v88[v94[8]] = v94[6];
					end;
					v90 = v90 + 1;				
				end;
			end;
		end)(u14(), {}, (getfenv or function()
			return _ENV;
		end)())() }) and nil;
end)(16777216, 5, 65536, tonumber, 4, string, ({ 1 })[1]);
