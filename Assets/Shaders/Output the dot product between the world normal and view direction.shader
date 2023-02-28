Shader "Custom/Output the dot product between the world normal and view direction"
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
                float3 normal : NORMAL;
            };
 
            struct v2f {
                float3 worldNormal : TEXCOORD0;
                float3 viewDir : TEXCOORD1;
                float4 vertex : SV_POSITION;
            };
 
            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.worldNormal = normalize(mul(UNITY_MATRIX_M, v.normal)).xyz;
                o.viewDir = normalize(UnityWorldSpaceViewDir(v.vertex)).xyz;
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                float dotProduct = dot(i.worldNormal, i.viewDir);
                return fixed4(dotProduct, dotProduct, dotProduct, 1.0);
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}
