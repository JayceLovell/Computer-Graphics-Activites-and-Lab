// running low on time so it tried something here honestly
Shader "Custom/ChangeSkyboxColor"
{
    Properties
    {
        _MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
        _myColor("Color", Color) = (1,1,1,1)
    }
    SubShader
    {        

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        fixed4 _myColor;
        samplerCUBE _myCube;

        struct Input
        {
            float3 worldRefl;
        };


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
           o.Emission = texCUBE(_myCube,IN.worldRefl).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
