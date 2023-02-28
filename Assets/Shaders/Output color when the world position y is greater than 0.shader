Shader "Custom/Output color when the world position y is greater than 0"
{
    Properties {
        _AboveColor ("Above Color", Color) = (1, 0, 0, 1)
        _BelowColor ("Below Color", Color) = (0, 0, 1, 1)
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
                float4 vertex : SV_POSITION;
                float3 worldPos : TEXCOORD0;
            };

            float4 _AboveColor;
            float4 _BelowColor;
 
            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.worldPos = mul(UNITY_MATRIX_M, v.worldPos);
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target {
                if (i.worldPos.y < 0.0 || 0.0 > i.worldPos.y) {
                    return _AboveColor;
                }
                else {
                    return _BelowColor;
                }
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}