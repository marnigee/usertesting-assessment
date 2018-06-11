# Game of Life Code Exercise

Here's my first pass at a Ruby version of The Game of Life.

## Tests

To test the app, run the following command:

```
$ rspec
```

This should be the output:

```
..................

Finished in 0.12322 seconds (files took 0.08304 seconds to load)
18 examples, 0 failures
```

## Things I like about how this design turned out
- Nice thin models
- Abstracted logic for the rules and for neighbor logic (dependency injection)
- Names that reflect the game's domain
- Lots of unit tests

## Things I'd like to improve
- Make a cleaner interface for the rules logic (`game_of_life.rb` knows too much about `conway_policy.rb` -- 2-step `evaluate_cells` and `update_cells` is not ideal)
- Refactor `cell_neigbors.rb` (lots of repetitive patterns there)

## If this was more than a code exercise, I would...
- Implement an infinite loop for generations as opposed to defining a specific number
- Fix a current bug where dead cells don't always get analyzed properly
- Flesh out what's being passed to front end -- some combination of cells and `grid.rb`
