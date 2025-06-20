import { defineConfig } from "vitepress";
import { tabsMarkdownPlugin } from "vitepress-plugin-tabs";
import mathjax3 from "markdown-it-mathjax3";
import footnote from "markdown-it-footnote";
import path from "path";

function getBaseRepository(base: string): string {
  if (!base || base === "/") return "/";
  const parts = base.split("/").filter(Boolean);
  return parts.length > 0 ? `/${parts[0]}/` : "/";
}

const baseTemp = {
  base: "/", // TODO: replace this in makedocs!
};

const navTemp = {
  nav: [{ text: "CodeSource", link: "/index" }],
};

const nav = [
  ...navTemp.nav,
  {
    component: "VersionPicker",
  },
];

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: "/", // TODO: replace this in makedocs!
  title: "",
  description: "Documentation for CodeSource.jl",
  lastUpdated: true,
  cleanUrls: true,
  outDir: "../1", // This is required for MarkdownVitepress to work correctly...
  head: [
    ["script", { src: `${getBaseRepository(baseTemp.base)}versions.js` }],
    // ['script', {src: '/versions.js'], for custom domains, I guess if deploy_url is available.
    ["script", { src: `${baseTemp.base}siteinfo.js` }],
  ],

  vite: {
    define: {
      __DEPLOY_ABSPATH__: JSON.stringify("/"),
    },
    resolve: {
      alias: {
        "@": path.resolve(__dirname, "../components"),
      },
    },
    optimizeDeps: {
      exclude: [
        "@nolebase/vitepress-plugin-enhanced-readabilities/client",
        "vitepress",
        "@nolebase/ui",
      ],
    },
    ssr: {
      noExternal: [
        // If there are other packages that need to be processed by Vite, you can add them here.
        "@nolebase/vitepress-plugin-enhanced-readabilities",
        "@nolebase/ui",
      ],
    },
  },
  markdown: {
    math: true,
    config(md) {
      md.use(tabsMarkdownPlugin), md.use(mathjax3), md.use(footnote);
    },
    theme: {
      light: "github-light",
      dark: "github-dark",
    },
  },
  themeConfig: {
    outline: "deep",

    search: {
      provider: "local",
      options: {
        detailedView: true,
      },
    },
    nav,
    editLink: {
      pattern:
        "https://https://github.com/ajinka-k/CodeSource.jl/edit/main/docs/src/:path",
    },
    socialLinks: [
      { icon: "github", link: "https://github.com/ajinka-k/CodeSource.jl" },
    ],
    footer: {
      message:
        'Made with <a href="https://luxdl.github.io/DocumenterVitepress.jl/dev/" target="_blank"><strong>DocumenterVitepress.jl</strong></a><br>',
      copyright: `© Copyright ${new Date().getUTCFullYear()}.`,
    },
  },
});
