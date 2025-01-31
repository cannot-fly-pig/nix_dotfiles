import { BaseConfig } from "https://deno.land/x/ddc_vim@v4.0.4/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddc_vim@v4.0.4/base/config.ts";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "pum",
      autoCompleteEvents: [
        "InsertEnter",
        "TextChangedI",
        "TextChangedP",
        "CmdlineEnter",
        "CmdlineChanged",
        "TextChangedT",
      ],
      sources: [ "around", "file" ],
      sourceOptions: {
        _: {
          ignoreCase: true,
          matchers: [ "matcher_head" ],
          sorters: [ "sorter_rank" ],
          converters: ["converter_remove_overlap"],
          timeout: 1000,
        },
        around: {
          mark: "A",
        },
        file: {
          mark: "F",
          isVolatile: true,
          minAutoCompleteLength: 1000,
          forceCompletionPattern: "\\s/\\s*|\\/\\w*",
        },
        "lsp": {
          mark: "lsp",
          forceCompletionPattern: "\\.\\w*|::\\w*|->\\w*",
          dup: "force",
        },
        "nvim-lua": {
          mark: "",
          forceCompletionPattern: "\\.\\w*",
        },
      }
    });

    args.contextBuilder.patchFiletype("lua", {
      sources: ["nvim-lua"],
    });

    for (
      const fileType of [
        "typescript",
        "typescriptreact",
        "tsx",
        "graphql",
        "cpp"
      ]
    ) {
      args.contextBuilder.patchFiletype(fileType, {
        sources: ["lsp", "around"],
      });
    }
  }
}
