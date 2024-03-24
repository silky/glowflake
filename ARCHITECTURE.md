# Architecture decisions and notes

### Present setup

- *Database stucture*: Everything is fairly simple; only mildly interesting
part is tags are a seperate table instead of, say, a list on the post. This
means we can fix the list of tags pretty easily, and manage them. Tags can
represent anything, which is kind of nice (happiness, which company, etc,
etc). It makes some queries a bit more complicated, but it's fine enough.

We use the basic/default for the primary keys and such; but in real life it's
probably better to use a UUID.

I used sqlite3 just because it's lightweight; I didn't want to have to spin up
postgres just to hack around.

- *React structure*: Again this is extremely minimal. We're not really passing
around data between components because there is only one place everything is
used. In general it'd be better to have parameterised components, say, for an
update to be rendered anywhere supposing someone has the `update` data. But
again, this is fine for now.

- *Nix infrastructure*: Using NixOS means I need to do a bit of busywork to
get a rails environment; and correspondingly even though rails generates, say,
`.ruby-version`, my environment ignores this. I've got something minimal, but
to be fully reproducible in any other Nix environment, a fair bit of work
would need to be done. In the past I've tried
[Bundix](https://github.com/nix-community/bundix), but I've had problems. In
reality I wouldn't concern myself too much, unless we went all-in on NixOps
for this project. Given that there's npm as well, it's pretty idiomatic to let
the package-manager grab these packages (just as we do for bundler here); so
it's not too big of an issue. The environment here let's me do productive dev
work, so that's all we need for now!

- *Sample data*: I used [Faker](https://github.com/faker-ruby/faker) to
generate some sample data. This worked nicely, and helped expose one issue
(namely, I needed to make a unique constraint on the `tag_id, work_update_id`
 pair on the `tag_work_updates` table). It also helped me test the rendering!)
 And I got to do fun things like use an interesting `created_at`, and get the
 list of tags correct.

- *API*: It's an _extremely_ simple API; i.e. just one route to return all
updates. Clearly, this is not enough for a real app, but enough to get us by
for now.

- *CSS*: I just used sass; I didn't want anything overly heavy as that's not
the goal here.


### Learnings/differently

- I would've run Rubucop first :)
- Probably some rubocop customisation is in order; it generates a _lot_ of warnings
- It's annoying that schema (re-)generation is incompatible with rubocop;
maybe there's a way to align those, or at least always run it after
- Maybe one could combine server-rendering and react rendering, so-as to
improve loads
- Probably pure sass is not what people like; I'm open-minded.
- Maybe I should've generated a `rails-minimal` thing instead of all the
`--skip...` I had to set
- [lobsters](https://github.com/lobsters/lobsters/) seems to be a modern rails
setup that probably has a lot of best practices I could steal
- I'm not convinced that a by-hand api definition is the fastest thing in
light of things like [Hasura](https://hasura.io/); maybe I would outsource the
graphql api there, keep the react frontend, and use rails for any
sophisticated server-side logic one requires. But there's a lot to think about
there; you lose the simplicity of ActiveRecord and gain a fair bit of
complexity in authentication and database/application structure.
