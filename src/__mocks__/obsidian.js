// Mock for Obsidian API in tests
module.exports = {
	Plugin: class Plugin {
		app = {};
		manifest = {};
		async loadData() {
			return {};
		}
		async saveData() {}
		addCommand() {}
		addRibbonIcon() {}
		addSettingTab() {}
		registerView() {}
		registerMarkdownPostProcessor() {}
		registerEditorExtension() {}
		addChild() {}
	},
	PluginSettingTab: class PluginSettingTab {
		app;
		plugin;
		containerEl = {
			empty: () => {},
			createEl: () => ({ createEl: () => ({}) }),
		};
		constructor(app, plugin) {
			this.app = app;
			this.plugin = plugin;
		}
		display() {}
		hide() {}
	},
	Setting: class Setting {
		constructor() {}
		setName() {
			return this;
		}
		setDesc() {
			return this;
		}
		addText() {
			return this;
		}
		addToggle() {
			return this;
		}
		addDropdown() {
			return this;
		}
		addButton() {
			return this;
		}
	},
	Notice: class Notice {
		constructor() {}
	},
	Modal: class Modal {
		app;
		contentEl = {
			empty: () => {},
			createEl: () => ({ createEl: () => ({}) }),
		};
		constructor(app) {
			this.app = app;
		}
		open() {}
		close() {}
		onOpen() {}
		onClose() {}
	},
	normalizePath: path => path,
	requestUrl: async () => ({ json: {}, text: "" }),
};
