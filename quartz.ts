import { loadQuartzConfig, loadQuartzLayout } from "./quartz/plugins/loader/config-loader"
import { AzgaarAtlas, AzgaarAtlasAssets } from "./quartz/plugins/transformers/azgaarAtlas"

const config = await loadQuartzConfig()

config.plugins.transformers.unshift(AzgaarAtlas())
config.plugins.emitters.push(AzgaarAtlasAssets())
config.configuration.ignorePatterns.push("**/*.atlas.json", "**/*.map")

export default config
export const layout = await loadQuartzLayout()
