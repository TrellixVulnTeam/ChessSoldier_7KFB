Shader "Hidden/Demo03/ModelShow" {

	SubShader{
		Tags{ "Queue" = "AlphaTest" "ModelShow" = "Player" }
		LOD 100


		// ------------------------------------------------------------
		// Surface shader code generated out of a CGPROGRAM block:


		// ---- forward rendering base pass:
		Pass{
		Name "FORWARD"
		Tags{ "LightMode" = "ForwardBase" }
		ColorMask RGBA

		CGPROGRAM
		// compile directives
#pragma vertex vert_surf
#pragma fragment frag_surf
#pragma target 3.0
#pragma multi_compile __ PER_OBJECT_LIGHTING	
#pragma shader_feature DEBUG_SKIN_COLOR
#pragma multi_compile_instancing
#pragma multi_compile_fog
#pragma multi_compile_fwdbase noshadow
#include "HLSLSupport.cginc"
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
		// -------- variant for: <when no other keywords are defined>
#if !defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

		sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: INSTANCING_ON 
#if defined(INSTANCING_ON) && !defined(DEBUG_SKIN_COLOR) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: DEBUG_SKIN_COLOR 
#if defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: DEBUG_SKIN_COLOR INSTANCING_ON 
#if defined(DEBUG_SKIN_COLOR) && defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING 
#if defined(PER_OBJECT_LIGHTING) && !defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING INSTANCING_ON 
#if defined(PER_OBJECT_LIGHTING) && defined(INSTANCING_ON) && !defined(DEBUG_SKIN_COLOR)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING DEBUG_SKIN_COLOR 
#if defined(PER_OBJECT_LIGHTING) && defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING DEBUG_SKIN_COLOR INSTANCING_ON 
#if defined(PER_OBJECT_LIGHTING) && defined(DEBUG_SKIN_COLOR) && defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 2 texcoords actually used
		//   float2 _MainTex
		//   float2 _GlowTex
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	// no lightmaps:
#ifndef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
#if UNITY_SHOULD_SAMPLE_SH
		half3 sh : TEXCOORD4; // SH
#endif
		UNITY_FOG_COORDS(5)
#if SHADER_TARGET >= 30
			float4 lmap : TEXCOORD6;
#endif
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	// with lightmaps:
#ifdef LIGHTMAP_ON
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float4 pack0 : TEXCOORD0; // _MainTex _GlowTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		float4 lmap : TEXCOORD4;
		UNITY_FOG_COORDS(5)
			UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
#endif
	float4 _MainTex_ST;
	float4 _GlowTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityObjectToClipPos(v.vertex);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		o.pack0.zw = TRANSFORM_TEX(v.texcoord, _GlowTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
#ifdef DYNAMICLIGHTMAP_ON
		o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
#ifdef LIGHTMAP_ON
		o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

		// SH/ambient and vertex lights
#ifndef LIGHTMAP_ON
#if UNITY_SHOULD_SAMPLE_SH
		o.sh = 0;
		// Approximated illumination from non-important point lights
#ifdef VERTEXLIGHT_ON
		o.sh += Shade4PointLights(
			unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
			unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
			unity_4LightAtten0, worldPos, worldNormal);
#endif
		o.sh = ShadeSHPerVertex(worldNormal, o.sh);
#endif
#endif // !LIGHTMAP_ON

		UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	surfIN.uv_GlowTex = IN.pack0.zw;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
	fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);

	// compute lighting & shadowing factor
	UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
		fixed4 c = 0;
	fixed3 worldN;
	worldN.x = dot(IN.tSpace0.xyz, o.Normal);
	worldN.y = dot(IN.tSpace1.xyz, o.Normal);
	worldN.z = dot(IN.tSpace2.xyz, o.Normal);
	o.Normal = worldN;

	// Setup lighting environment
	UnityGI gi;
	UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
	gi.indirect.diffuse = 0;
	gi.indirect.specular = 0;
	gi.light.color = _LightColor0.rgb;
	gi.light.dir = lightDir;
	// Call GI (lightmaps/SH/reflections) lighting function
	UnityGIInput giInput;
	UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
	giInput.light = gi.light;
	giInput.worldPos = worldPos;
	giInput.worldViewDir = worldViewDir;
	giInput.atten = atten;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	giInput.lightmapUV = IN.lmap;
#else
	giInput.lightmapUV = 0.0;
#endif
#if UNITY_SHOULD_SAMPLE_SH
	giInput.ambient = IN.sh;
#else
	giInput.ambient.rgb = 0.0;
#endif
	giInput.probeHDR[0] = unity_SpecCube0_HDR;
	giInput.probeHDR[1] = unity_SpecCube1_HDR;
#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
	giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
#endif
#ifdef UNITY_SPECCUBE_BOX_PROJECTION
	giInput.boxMax[0] = unity_SpecCube0_BoxMax;
	giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
	giInput.boxMax[1] = unity_SpecCube1_BoxMax;
	giInput.boxMin[1] = unity_SpecCube1_BoxMin;
	giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	LightingCharacterHighQuality_GI(o, giInput, gi);

#if UNITY_SHOULD_SAMPLE_SH
	gi.indirect.diffuse = 0;
#endif

	// realtime lighting: call lighting function
	c += LightingCharacterHighQuality(o, worldViewDir, gi);
	UNITY_APPLY_FOG(IN.fogCoord, c); // apply fog
	return c;
	}


#endif


		ENDCG

	}

		// ---- shadow caster pass:
		Pass{
		Name "ShadowCaster"
		Tags{ "LightMode" = "ShadowCaster" }
		ZWrite On ZTest LEqual

		CGPROGRAM
		// compile directives
#pragma vertex vert_surf
#pragma fragment frag_surf
#pragma target 3.0
#pragma multi_compile __ PER_OBJECT_LIGHTING	
#pragma shader_feature DEBUG_SKIN_COLOR
#pragma multi_compile_instancing
#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
#pragma multi_compile_shadowcaster noshadow
#include "HLSLSupport.cginc"
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
		// -------- variant for: <when no other keywords are defined>
#if !defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

		sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: INSTANCING_ON 
#if defined(INSTANCING_ON) && !defined(DEBUG_SKIN_COLOR) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: DEBUG_SKIN_COLOR 
#if defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: DEBUG_SKIN_COLOR INSTANCING_ON 
#if defined(DEBUG_SKIN_COLOR) && defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING 
#if defined(PER_OBJECT_LIGHTING) && !defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING INSTANCING_ON 
#if defined(PER_OBJECT_LIGHTING) && defined(INSTANCING_ON) && !defined(DEBUG_SKIN_COLOR)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING DEBUG_SKIN_COLOR 
#if defined(PER_OBJECT_LIGHTING) && defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING DEBUG_SKIN_COLOR INSTANCING_ON 
#if defined(PER_OBJECT_LIGHTING) && defined(DEBUG_SKIN_COLOR) && defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_SHADOWCASTER
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}



	// vertex-to-fragment interpolation data
	struct v2f_surf {
		V2F_SHADOW_CASTER;
		float2 pack0 : TEXCOORD1; // _MainTex
		float3 worldPos : TEXCOORD2;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		o.worldPos = worldPos;
		TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
			return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = IN.worldPos;
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	SHADOW_CASTER_FRAGMENT(IN)
	}


#endif


		ENDCG

	}

		// ---- meta information extraction pass:
		Pass{
		Name "Meta"
		Tags{ "LightMode" = "Meta" }
		Cull Off

		CGPROGRAM
		// compile directives
#pragma vertex vert_surf
#pragma fragment frag_surf
#pragma target 3.0
#pragma multi_compile __ PER_OBJECT_LIGHTING	
#pragma shader_feature DEBUG_SKIN_COLOR
#pragma multi_compile_instancing noshadow
#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
#pragma skip_variants INSTANCING_ON
#pragma shader_feature EDITOR_VISUALIZATION

#include "HLSLSupport.cginc"
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
		// -------- variant for: <when no other keywords are defined>
#if !defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_META
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

		sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}


#include "UnityMetaPass.cginc"

	// vertex-to-fragment interpolation data
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float2 pack0 : TEXCOORD0; // _MainTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	UnityMetaInput metaIN;
	UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
	metaIN.Albedo = o.Albedo;
	metaIN.Emission = o.Emission;
	metaIN.SpecularColor = o.Specular;
	return UnityMetaFragment(metaIN);
	}


#endif

		// -------- variant for: DEBUG_SKIN_COLOR 
#if defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON) && !defined(PER_OBJECT_LIGHTING)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_META
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}


#include "UnityMetaPass.cginc"

	// vertex-to-fragment interpolation data
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float2 pack0 : TEXCOORD0; // _MainTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	UnityMetaInput metaIN;
	UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
	metaIN.Albedo = o.Albedo;
	metaIN.Emission = o.Emission;
	metaIN.SpecularColor = o.Specular;
	return UnityMetaFragment(metaIN);
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING 
#if defined(PER_OBJECT_LIGHTING) && !defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_META
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}


#include "UnityMetaPass.cginc"

	// vertex-to-fragment interpolation data
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float2 pack0 : TEXCOORD0; // _MainTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	UnityMetaInput metaIN;
	UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
	metaIN.Albedo = o.Albedo;
	metaIN.Emission = o.Emission;
	metaIN.SpecularColor = o.Specular;
	return UnityMetaFragment(metaIN);
	}


#endif

		// -------- variant for: PER_OBJECT_LIGHTING DEBUG_SKIN_COLOR 
#if defined(PER_OBJECT_LIGHTING) && defined(DEBUG_SKIN_COLOR) && !defined(INSTANCING_ON)
		// Surface shader code generated based on:
		// writes to per-pixel normal: YES
		// writes to emission: no
		// writes to occlusion: no
		// needs world space reflection vector: no
		// needs world space normal vector: no
		// needs screen space position: no
		// needs world space position: no
		// needs view direction: no
		// needs world space view direction: no
		// needs world space position for lighting: YES
		// needs world space view direction for lighting: YES
		// needs world space view direction for lightmaps: no
		// needs vertex color: no
		// needs VFACE: no
		// passes tangent-to-world matrix to pixel shader: YES
		// reads from normal: no
		// 1 texcoords actually used
		//   float2 _MainTex
#define UNITY_PASS_META
#include "UnityCG.cginc"
#include "Lighting.cginc"

#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))

		// Original surface shader snippet:
#line 5 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
		/* UNITY: Original start of shader */
#include "../GameCG.cginc"

		//#pragma target 3.0
		//#pragma surface surf CharacterHighQuality alphatest:_Cutoff addshadow noforwardadd noambient noshadow 
		//#pragma multi_compile __ PER_OBJECT_LIGHTING	
		//#pragma shader_feature DEBUG_SKIN_COLOR

	sampler2D _MainTex;
	sampler2D _GlowTex;
	sampler2D _BumpMap;
	sampler2D _SpecularMap;
	half _BumpScale;
	half _Shininess;
	half _Gloss;
	fixed4 _Color;
	fixed3 _FlashColor;
	fixed _FlashIntensity;
	float _RimLightIntensity;
	fixed4 _GlowColor;
	fixed3 _SkinColor;
	float3 _CharacterLightDir;
	fixed3 _CharacterLightColor;

#ifdef PER_OBJECT_LIGHTING
	float3 _CharacterLightDir2;
	fixed3 _CharacterLightColor2;
#endif

	struct Input {
		float2 uv_MainTex;
		float2 uv_GlowTex;
		//			float2 uv_BumpMap;
		//			float2 uv_SpecularMap;
		INTERNAL_DATA
	};

	void surf(Input IN, inout SurfaceOutput_CharacterHighQuality o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		fixed4 s = tex2D(_SpecularMap, IN.uv_MainTex);
		fixed3 n = CustomUnpackScaleNormal(tex2D(_BumpMap, IN.uv_MainTex), _BumpScale);
		float2 guv = IN.uv_GlowTex + float2(_Time.y*0.25 + sin(_Time.y)*0.1, _Time.y*0.3 + sin(_Time.y)*0.05);
		fixed3 g = _GlowColor * tex2D(_GlowTex, guv) * 10 * (sin(_Time.y) * 0.5 + 1);
		o.Albedo = c.rgb;
		o.Normal = n;
		o.Specular = _Shininess;
		o.Gloss = _Gloss;
		o.Alpha = c.a;
		o.SpecColor = s.rgb;
		o.Glow = g;
		o.FlashColor = _FlashColor;
		o.FlashIntensity = _FlashIntensity;

#ifdef PER_OBJECT_LIGHTING
		o.lightDir = normalize(_CharacterLightDir2);
		o.lightColor = _CharacterLightColor2;
#else
		o.lightDir = normalize(_CharacterLightDir);
		o.lightColor = _CharacterLightColor;
#endif
	}


#include "UnityMetaPass.cginc"

	// vertex-to-fragment interpolation data
	struct v2f_surf {
		float4 pos : SV_POSITION;
		float2 pack0 : TEXCOORD0; // _MainTex
		float4 tSpace0 : TEXCOORD1;
		float4 tSpace1 : TEXCOORD2;
		float4 tSpace2 : TEXCOORD3;
		UNITY_VERTEX_INPUT_INSTANCE_ID
			UNITY_VERTEX_OUTPUT_STEREO
	};
	float4 _MainTex_ST;

	// vertex shader
	v2f_surf vert_surf(appdata_full v) {
		UNITY_SETUP_INSTANCE_ID(v);
		v2f_surf o;
		UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
		UNITY_TRANSFER_INSTANCE_ID(v,o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
		o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
		float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
		fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
		fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
		fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
		fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
		o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
		o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
		o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
		return o;
	}
	fixed _Cutoff;

	// fragment shader
	fixed4 frag_surf(v2f_surf IN) : SV_Target{
		UNITY_SETUP_INSTANCE_ID(IN);
	// prepare and unpack data
	Input surfIN;
	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
	surfIN.uv_MainTex.x = 1.0;
	surfIN.uv_GlowTex.x = 1.0;
	surfIN.uv_MainTex = IN.pack0.xy;
	float3 worldPos = float3(IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w);
#ifndef USING_DIRECTIONAL_LIGHT
	fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	fixed3 lightDir = _WorldSpaceLightPos0.xyz;
#endif
#ifdef UNITY_COMPILER_HLSL
	SurfaceOutput_CharacterHighQuality o = (SurfaceOutput_CharacterHighQuality)0;
#else
	SurfaceOutput_CharacterHighQuality o;
#endif
	o.Albedo = 0.0;
	o.Emission = 0.0;
	o.Specular = 0.0;
	o.Alpha = 0.0;
	fixed3 normalWorldVertex = fixed3(0,0,1);

	// call surface function
	surf(surfIN, o);

	// alpha test
	clip(o.Alpha - _Cutoff);
	UnityMetaInput metaIN;
	UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
	metaIN.Albedo = o.Albedo;
	metaIN.Emission = o.Emission;
	metaIN.SpecularColor = o.Specular;
	return UnityMetaFragment(metaIN);
	}


#endif


		ENDCG

	}

		// ---- end of surface shader generated code

		#LINE 69

	}
		FallBack "Diffuse"
}
