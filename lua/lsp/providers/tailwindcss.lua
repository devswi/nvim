return {
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidConfigPath = 'error',
        invalidScreen = 'error',
        invalidTailwindDirective = 'error',
        invalidVariant = 'error',
        recommendedVariantOrder = 'warning',
      },
      experimental = {
        classRegex = {
          'tw`([^`]*)',
          'tw="([^"]*)',
          'tw={"([^"}]*)',
          'tw\\.\\w+`([^`]*)',
          'tw\\(.*?\\)`([^`]*)',
        },
      },
      validate = true,
    },
  },
}
