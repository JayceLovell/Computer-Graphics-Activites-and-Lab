Shader "Custom/MyFirstShader"{
	Properties {
		_myColor("Color", Color) = (1,1,1,1)
		_myRange("Range",Range(0,5))=1
		_myTex("Texture",2D) = "White" {}
		_myCube("Cube",CUBE) = ""{}
		_myFloat("Float",Float)=0.5
		_myVector("Vector",Vector)=(0.5,1,1,1)
		//_myEmission ("Emission", Color) = (1,1,1,1)
		//_myNormal ("Normal", Color) = (1,1,1,1)
	}
	SubShader {
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float2 uv_myTex;
			float2 uv_MainTex;
			float3 worldRefl;
		};

	fixed4 _myColor;
	half _myRange;
	sampler2D _myTex;
	samplerCUBE _myCube;
	float _myFloat;
	float _myVector;
	//fixed4 _myEmission;
	//fixed4 _myNormal;

	void surf (Input IN, inout SurfaceOutput o) {
		o.Albedo = (tex2D(_myTex,IN.uv_myTex) * _myRange).rgb;
		o.Emission = texCUBE(_myCube,IN.worldRefl).rgb;
		//o.Normal = _myNormal;
	}
	ENDCG
	}
	FallBack "Diffuse"
}