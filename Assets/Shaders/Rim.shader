// I chose rim and just made sure that the texture showed to give the look of a shield.
Shader "Custom/Rim"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" { }
        _RimColor("Rim Color", Color) = (0,0.5,0.5,0.0)
        _RimPower("Rim Power", Range(0.5,8.0)) = 0.5
    }
    SubShader
    {
        //Tags { "Queue" = "Transparent" }
        
        Pass{
        ZWrite On
        ColorMask 0
        }

        CGPROGRAM
     
        #pragma surface surf Lambert alpha:fade

        struct Input
        {
            float3 viewDir;
            float2 uv_MainTex;
        };

        sampler2D _MainTex;
        float4 _RimColor;
        float _RimPower;
        
        void surf(Input IN, inout SurfaceOutput o){
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _RimColor.rgb * pow(rim, _RimPower)* 10;
            o.Alpha = pow(rim, _RimPower);
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }        
        ENDCG
    }
    FallBack "Diffuse"
}
