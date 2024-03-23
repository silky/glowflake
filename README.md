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
- Look in the database with `sqlitebrowser storage/development.sqlite3`


### Notes

**Plan**

- [ ] Work status updates
- [ ] People
- [ ] Minimal information in an update: sentence or two, labels, date.
- [ ] List of updates by label


**Todo**

- [ ] React page to view them
- [x] Basic rails site
- [x] Nix setup
- [x] Sample data to make a bunch
- [x] Simple REST api for updates
- [x] Very simple db structure: people, updates, tags
- [x] ~Process-Compose~ Just using foreman.


**Optional todo**

- [ ] Login with some kind of oauth
- [ ] Editing updates
- [ ] Emoji reactions
- [ ] Tidying up the REST api so it's more efficient (see <https://github.com/silky/glowflake/pull/3>).
- [ ] ???
