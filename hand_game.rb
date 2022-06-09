class Hand
  def hand()
    @randam_hand = rand(3)
    input_finger = Finger.new()
    puts "じゃんけん..."
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    @janken = ["グー","チョキ","パー"]
    @my_hand = gets.to_i

    if (@my_hand <= 2) && (@my_hand >= 0)
      puts "ホイ！"
      puts "---------------"
      puts "あなた：#{@janken[@my_hand]}を出しました"
      puts "相手：#{@janken[@randam_hand]}を出しました"
      puts "---------------"
      #あいこの場合hand_aiko()を呼ぶ
      if @my_hand == @randam_hand
        hand_aiko()
      #勝った場合finger()を呼ぶ
      elsif (@my_hand == 0 && @randam_hand == 1) || (@my_hand == 1 && @randam_hand == 2) || (@my_hand == 2 && @randam_hand == 0)
        input_finger.finger()
      #負けた場合finger()を呼ぶ
      elsif (@my_hand == 0 && @randam_hand == 3) || (@my_hand == 1 && @randam_hand == 0) || (@my_hand == 2 && @randam_hand == 1)
        input_finger.finger()
      end
    elsif @my_hand == 3
      puts "終了します"
      exit
    elsif
      puts "0〜3を入力してください"
      hand()
    end
  end

  def hand_aiko()
    input_finger = Finger.new()
    $game = nil
    puts "あいこで..."
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    @my_hand = gets.to_i

    if (@my_hand <= 2) && (@my_hand >= 0)
      puts "ホイ！"
      puts "---------------"
      puts "あなた：#{@janken[@my_hand]}を出しました"
      puts "相手：#{@janken[@randam_hand]}を出しました"
      puts "---------------"
      #あいこの場合hand_aiko()を呼ぶ
      if @my_hand == @randam_hand
        hand_aiko()
      #勝った場合finger()を呼ぶ
      elsif (@my_hand == 0 && @randam_hand == 1) || (@my_hand == 1 && @randam_hand == 2) || (@my_hand == 2 && @randam_hand == 0)
        $game = "win"
        input_finger.finger()
      #負けた場合finger()を呼ぶ
      elsif (@my_hand == 0 && @randam_hand == 3) || (@my_hand == 1 && @randam_hand == 0) || (@my_hand == 2 && @randam_hand == 1)
        $game = "lose"
        input_finger.finger()
      end
    elsif @my_hand == 3
      puts "終了します"
      exit
    elsif
      puts "0〜3を入力してください"
      hand()
    end
  end
end

class Finger
  def finger()
    randam_finger = rand(4)
    input_hand = Hand.new()
    puts "あっち向いて〜"
    puts "0(上)1(下)2(左)3(右)4(戦わない)"
    attimuite = ["上","下","左","右"]
    my_finger = gets.to_i

    if (my_finger <= 3) && (my_finger >= 0)
      puts "ホイ！"
      puts "---------------"
      puts "あなた：#{attimuite[my_finger]}を出しました"
      puts "相手：#{attimuite[randam_finger]}を出しました"
      puts "---------------"
      if (my_finger == randam_finger) && ($game == "win")
        puts "あなたの勝ちです"
      elsif (my_finger == randam_finger) && ($game == "lose")
        puts "あなたの負けです"
      elsif my_finger != randam_finger
        input_hand.hand()
      end
    elsif my_finger == 4
      puts "終了します"
      exit
    elsif
      puts "0〜4を入力してください"
      finger()
    end
  end
end

hand_game = Hand.new()
hand_game.hand()