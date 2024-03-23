# Glowflake

### Database setup

```shell
rails db:reset
rails db:generate_sample_data
```


### Running

From the Nix shell:

```shell
npm i
bundle exec -- foreman start -f Procfile.dev
```

Then open: <http://localhost:5005/>.


### Trivia

- (Auto)-Formatting with `rubocop -A`
- Look in the database with `sqlitebrowser storage/development.sqlite3


### Notes

**Plan**

- [ ] Work status updates
- [ ] People
- [ ] Minimal information in an update: sentence or two, labels, date.
- [ ] List of updates by label


**Todo**

- [x] Nix setup
- [x] ~Process-Compose~ Just using foreman.
- [x] Basic rails site
- [x] Very simple db structure: people, updates, tags
- [ ] Simple REST api for updates
- [ ] React page to view them
- [ ] Seed to make a bunch


**Optional todo**

- [ ] Login with some kind of oauth
- [ ] Editing updates
- [ ] Emoji reactions?
- ???
