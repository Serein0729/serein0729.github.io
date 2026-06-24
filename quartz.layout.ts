import { QuartzLayout } from "./quartz/cfg"

const layout: QuartzLayout = {
  header: {
    title: "V3ry0's Security Lab",
    spacer: {},
    search: {},
    darkmode: {},
  },
  left: [
    { Component: "PageList" },
    { Component: "FolderContent" },
    { Component: "TagContent" },
    { Component: "RecentNotes" },
  ],
  right: [
    { Component: "Graph" },
    { Component: "Backlinks" },
    { Component: "TableOfContents" },
  ],
}

export default layout
