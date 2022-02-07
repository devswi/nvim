local present, colorizer = pcall(require, "colorizer")

if not present then
    return
end

colorizer.setup(
    {
        "*";
    },
    {
        RGB = true;
        RRGGBB = true;
        names = true;
        RRGGBBAA = true;
        rgb_fn = true;
        hsl_fn = true;
        css = true;
        csss_fn = true;
        mode = 'background';
    }
)

