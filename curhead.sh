#!/usr/bin/env iced
_ = require('wegweg')({
  globals: on
  shelljs: on
})

bulk = _.reads "#{process.env.HOME}/.cur"

sections = _.ucmap bulk.split('\n\n'), (x) ->
  if !x.trim() then return null
  return x

args = process.argv

num = args.pop()
if _.type(num) is 'string' then num = num.split('-').join('')
num = +num

if isNaN(num) then num = 1

arr = []
for x in [1..num]
  index = (x - 1)
  if sections[index]
    arr.push sections[index]

log arr.join('\n\n')
exit 0

