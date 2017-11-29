ImageTarget.create(
  target: "top_slide",
  path: "img/slide"
)
2014.upto(Date.today.months_ago(3).year) do |year|
  ImageTarget.create(
    target: "g#{year}",
    path: "img/grade"
  )
end
2013.upto(Date.today.months_ago(3).year) do |year|
  ImageTarget.create(
    target: "r#{year}",
    path: "img/result"
  )
end
