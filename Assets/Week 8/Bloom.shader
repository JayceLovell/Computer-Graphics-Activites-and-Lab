Shader "Custom/Bloom" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
	}
	CGINCLUDE
		#include "UnityCG.cginc"
		sampler2D _MainTex, _SourceTex;
		float4 _MainTex_TexelSize;

		struct VertexData {
			float4 vertex : POSITION;
			float2 uv : TEXCOORD0;
		};

		struct Interpolators {
			float4 pos : SV_POSITION;
			float2 uv : TEXCOORD0;
		};

		Interpolators VertexProgram (VertexData v) {
			Interpolators i;
			i.pos = UnityObjectToClipPos(v.vertex);
			i.uv = v.uv;
			return i;
		}

		half Sample(float2 uv){
			return tex2D(_MainTex, uv).rgb;
		}
		half3 SampleBox(float2 uv, float delta){
			float4 o = _MainTex_TexelSize.xyxy * float2(-delta,delta).xxyy;
			half3 s = 
				Sample(uv +o.xy) + Sample(uv+o.zy) +
				Sample(uv + o.xw) + Sample(uv + o.zw);
			return s * 0.25f;
		}
		ENDCG

	SubShader {
		Cull Off
		ZTest Always
		ZWrite Off

		Pass {
			CGPROGRAM
				#pragma vertex VertexProgram
				#pragma fragment FragmentProgram
				half4 FragmentProgram (Interpolators i) : SV_Target {
					return half4(SampleBox(i.uv,1), 1);
				}
			ENDCG
		}
		Pass{
			CGPROGRAM
				#pragma vertex VertexProgram
				#pragma fragment FragmentProgram
				half4 FragmentProgram(Interpolators i) : SV_Target{
					return half4(SampleBox(i.uv,1),1);
				}
				ENDCG
		}
	}
}