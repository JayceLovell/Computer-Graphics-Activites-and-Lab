Shader "Custom/Output the dot product between the world normal and view direction"
{

 
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
 
            //#include "UnityCG.cginc"
            #include "UnityStandardCore.cginc"
 
            struct appdata {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
 
            struct v2f {
                float3 viewDir : TEXCOORD0;
                float3 worldNormal : TEXCOORD1;
                float4 vertex : SV_POSITION;
            };
 
            uniform float4x4 _ViewMatrix;
 
            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.viewDir = normalize(UnityWorldSpaceViewDir(v.vertex.xyz));
                o.worldNormal = normalize(UnityObjectToWorldNormal(v.vertex));
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                 float3 albedo = dot(i.viewDir,i.worldNormal);
                return fixed4(albedo,1);
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}
