require 'redmine'
require 'redmine_slack/patches/user_preference_patch'
require 'redmine_slack/patches/issue_patch'

UserPreference.send(:include, RedmineSlack::Patches::UserPreferencePatch)
Issue.send(:include, RedmineSlack::Patches::IssuePatch)

Redmine::Plugin.register :redmine_slack do
	name 'Redmine Slack'
	author 'Samuel Cormier-Iijima'
	url 'https://github.com/sciyoshi/redmine-slack'
	author_url 'http://www.sciyoshi.com'
	description 'Slack chat integration'
	version '0.1.1'

	requires_redmine :version_or_higher => '0.8.0'

	settings \
		:default => {
			'callback_url' => 'http://slack.com/callback/',
			'channel' => nil,
			'icon' => 'https://raw.github.com/sciyoshi/redmine-slack/gh-pages/icon.png',
			'username' => 'redmine',
			'display_watchers' => 'no',
		},
		:partial => 'settings/slack_settings'
end
