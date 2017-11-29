theme = %w(持久力の科学 Triathlon-Anatomy 自転車の世界-Vol.1 体力測定の意義を知る レースの準備
レースパフォーマンスを高めるために-vol.1 トライアスロンランのペース戦略 『評価』の重要性-vol.1
『評価』の重要性-vol.2)
0.upto(8) do |idx|
  Lab::Seminar.create(
    title: "第#{idx+1}回勉強会",
    theme: theme[idx],
    date: Date.new(2015,12,12) >> idx,
    point_1: "ポイント1",
    point_2: "ポイント2",
    point_3: "",
    point_4: "",
    point_5: "",
    remark: "",
    document: nil,
    document_type: "pptx"
  )
end
