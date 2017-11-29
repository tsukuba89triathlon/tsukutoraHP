body = %w{
  活動実績更新 2017リザルト更新 勉強会ページ開設 新歓ページ開設 学年更新及びスマホ版体裁修正
  プロフィール編集機能更新 2016リザルト更新 スマートフォン用表示対応 プロフィール編集機能公開
  Web公開完了・運用開始 お問い合わせフォーム作成完了 つくトラメンバー向けページ作成完了
  OB・OG向けページ作成完了 2012年度リザルトページ複製完了 リザルトアーカイブページ作成完了
  ロゴ画像作成 メニューバー更新 MT資料ページ完成 Topページスライドショー完成
  リザルトページ作成完了 2013年度リザルトページ複製完了 2014年度リザルトページ複製完了
  メンバーページ作成完了 Topページを改装しました 2016年度リザルトページ複製完了
  2015年度リザルトページ複製完了 ギャラリーページ作成完了 新規HP作成開始
}
links = %w{
  about results/year/2017 lab/seminar "" "" account results/year/2016 "" account
  "" "" for_members for_ob_members results/year/2012 results/archives "" #dropmenu
  documents #slide results results/year/2013 results/year/2014 members
  "" results/year/2016 results/year/2015 gallarey ""
}
0.upto(27) do |idx|
  ReleasedInfo.create(
    date: Date.new(2017,6,1) << idx,
    body: body[idx],
    link: links[idx]
  )
end
