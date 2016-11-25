# Update Cardinals By delta for Postgresql.

## Important note

While I trust the logic, this gem is using some private activerecord methods that seem to change a lot from minor version to minor version. Therefor only 4.2 is supported for now. I'm still looking for better ways of building the sql and casting the values.

## Function

A gem to more safely update cardinal numbers like credits.

It will
* start a transaction
* make the change with a delta `attr = attr + #{attributes[attr]}}`
* call the given block with an indifferent hash of the latest values in the db.
* update the given attributes on the instance to the latest values.
* end transaction.

If any exceptions are thrown in the block, the change will automatically be reverted.

Sql will be like:

```sql
  update accounts set credits = credit + -20 where id = 6 returning credits
```

## Usage:

```Gemfile
gem 'update_cardinals_by', '~> 0.0.1'
```

```ruby
update_cardinals_by!(credits: -20) do |res|
  fail 'not enough credits' if res[:credits] < 0
  CreateWantedItems.run(..)
  CreditMutation.create credits_new: res[:credits],
                        credits_old: credits,
                        credits_change: -20
end
```
