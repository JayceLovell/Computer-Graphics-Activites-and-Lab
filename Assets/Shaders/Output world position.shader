Shader "Custom/Output world position"
{
   SubShader {
        Pass {
            CGPROGRAM
            // Vertex shader
            #pragma vertex vert
            // Fragment shader
            #pragma fragment frag
            // Include file for commonly used Unity shader code
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
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                return fixed4(i.worldPos, 1);
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}