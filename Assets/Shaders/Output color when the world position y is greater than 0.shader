Shader "Custom/Output color when the world position y is greater than 0"
{
    Properties{
       _PositiveColor ("Positive Color", Color) = (1, 0, 0, 1)
       _NegativeColor ("Negative Color", Color) = (0, 0, 1, 1)
    }
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

            // Positive color
            float4 _PositiveColor;
            // Negative color
            float4 _NegativeColor;

            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                if(i.worldPos.y >0){
                    return _PositiveColor;
                }
                else{
                    return _NegativeColor;
                }                
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}