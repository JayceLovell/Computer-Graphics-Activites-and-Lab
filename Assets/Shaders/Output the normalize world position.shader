Shader "Custom/Output the normalize world position"
{
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
    }
 
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
                float3 worldPos : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
 
            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.worldPos = normalize(mul(UNITY_MATRIX_M, v.worldPos));
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                return fixed4(i.worldPos, 1.0);
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}
