Shader "Custom/OutPut UV coordinates"
{
 
    SubShader {
        Tags {"Queue"="Transparent" "RenderType"="Opaque"}
        LOD 100

        Pass {
            CGPROGRAM
            // Vertex shader
            #pragma vertex vert
            // Fragment shader
            #pragma fragment frag
            // Include file for commonly used Unity shader code
            #include "UnityCG.cginc"
 
            // Input vertex data structure
            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
 
            // Output vertex data structure
            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

 
            // Vertex shader function
            v2f vert (appdata v) {
                v2f o;
                // Transform the vertex position from object space to clip space
                o.vertex = UnityObjectToClipPos(v.vertex);
                // Pass through the UV coordinates
                o.uv = v.uv;
                return o;
            }
            // Fragment shader function
            fixed4 frag (v2f i) : SV_Target {
                // Return a fixed4 color where the RGB values correspond to the UV coordinates
                // and the alpha value is set to 1
                return fixed4(i.uv, 0, 1);
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}
