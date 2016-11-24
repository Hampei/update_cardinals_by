# Update Cardinals

A gem to more safely update cardinal numbers like credits.

It will start a transaction, make the change with a delta and call the given block. If any exceptions are thrown in the block, the change will be reverted.

Sql will be like

```sql
  update accounts set credits = credit + -20 where id = 6
```


Usage:

```ruby
change_counters_by!(credits: -20) do |res|
  fail 'not enough credits' if res[:credits] < 0
  CreateWantedItems.run(..)
  CreditMutation.create(credits_new: res[:credits], credits_change: -20)
end
```
