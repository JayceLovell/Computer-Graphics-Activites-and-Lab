Shader "Custom/Output View Direction"
{
 
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
 
            #include "UnityCG.cginc"
 
            struct appdata {
                float4 vertex : POSITION;
                float3 worldPos : TEXCOORD0;
            };
 
            struct v2f {
                float3 viewDir : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
 
            uniform float4x4 _ViewMatrix;
 
            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.viewDir = normalize(UnityWorldSpaceViewDir(v.vertex.xyz));
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                return fixed4(i.viewDir, 1.0);
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}
