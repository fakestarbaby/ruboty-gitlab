# Ruboty::Gitlab

Manage GitLab via Ruboty.

## Install

```ruby
# Gemfile
gem "ruboty-gitlab"
```

## Usage

```
@ruboty create gitlab issue "<title>" on <project>[\n<description>] - Create a new issue
@ruboty remember my gitlab token <token> - Remember sender's GitLab private token
```

## ENV

```
GITLAB_URL - GitLab URL (e.g. https://gitlab.example.co.jp)
```
