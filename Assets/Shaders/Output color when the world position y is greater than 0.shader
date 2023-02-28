Shader "Custom/Output color when the world position y is greater than 0"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
        
            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed frag (v2f i) : SV_Target
            {
                fixed4 col = i.color;
                col.r=(i.vertex.x+5)/5;
                col.g=(i.vertex.z+5)/5;
                return col;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}