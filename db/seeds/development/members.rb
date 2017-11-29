names = %w{石山隼 岩碕幹生 青木匠 和間雄司 雨宮美宇 秋本和宏 荒巻徹 青柳篤 高橋啓悟}
yomis = %w{イシヤマハヤト イワサキミキオ アオキタクミ ワマユウジ アメミヤミュウ アキモトカズヒロ アラマキトオル アオヤギアツシ タカハシケイゴ}
grade = %w{1 2 3 3 4 11 12 21 22}
belongs = %w{17 24 24 13 24 90 58 78 78}
0.upto(8) do |idx|
Member.create(
  full_name: names[idx],
  user_name: names[idx],
  yomigana: yomis[idx],
  administration: idx == 3 ? true : false,
  lab_admin: idx == 3 ? true : false,
  password: "password",
  password_confirmation: "password",
  status: 1,
  grade: grade[idx],
  college_id: belongs[idx],
  belong: belongs[idx] == '24' ? "#{Admin::College.find(belongs[idx]).school.school}" : "#{Admin::College.find(belongs[idx]).school.school} #{Admin::College.find(belongs[idx]).college}",
  hometown: "",
  school: "",
  sports: "",
  bike: "",
  q1: "",
  a1: "",
  q2: "",
  a2: "",
  q3: "",
  a3: "",
  q4: "",
  a4: "",
  q5: "",
  a5: "",
  part: "",
  goal: "",
  last: "",
  graduated_year: nil,
  remark: "")
end
names = %w{石毛功平 森亮太 宇久村苗実 小竹拓真 近藤彰彦 堀雄太}
grade = %w{12 4 4 4 4 12}
belongs = %w{57 17 6 25 1 79}
graduate = %w{2017 2017 2017 2017 2016 2016}
0.upto(5) do |idx|
Member.create(
  full_name: names[idx],
  user_name: names[idx],
  password: "password",
  password_confirmation: "password",
  status: 3,
  grade: grade[idx],
  college_id: belongs[idx],
  belong: "#{Admin::College.find(belongs[idx]).school.school} #{Admin::College.find(belongs[idx]).college}",
  hometown: "",
  school: "",
  sports: "",
  bike: "",
  q1: "",
  a1: "",
  q2: "",
  a2: "",
  q3: "",
  a3: "",
  q4: "",
  a4: "",
  q5: "",
  a5: "",
  part: "",
  goal: "",
  last: "",
  graduated_year: Date.new(graduate[idx].to_i,3,31),
  remark: "")
end
