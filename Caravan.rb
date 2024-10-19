use_bpm 135

ride    = [0.8,0,0.6,0 , 0.8,0,0.5,0 , 0.8,0,0.6,0 , 0.8,0,0.5,0]
snare   = [0,0.1,0.05,0 , 0,0.1,0.1,0.8 , 0,0.1,0.05,0 , 0.6,0,0,0.2]
kick    = [1.4,0,0,1.4 , 0,0,1.4,0 , 1.4,0,0,1.4 , 0,0,1.4,0]
foot    = [1,0,0,0 , 1,0,0,0 , 1,0,0,0 , 1,0,0,0]

bar = 0

ride1    = [[1,0,0,1 , 0,0,1,0 , 0,1,0,0 , 1,0,0,1],
            [0,0,1,0,0,1 , 0,0,1,0 , 0,1,0,0 , 1,0,0]]

snare1   = [[0,0.2,0,0  , 0.2,0,0,0.2  , 0,0,0.2,0 , 0,0.2,0,0],
            [0.2,0,0,0.2, 0,0,0.2,0.2 , 0.2,0.4,0.8,1  , 1.2,1,1.2,1.4]]

kick1    = [[1,0,1,1 , 0,1,1,0 , 1,1,0,1 , 1,0,1,1,],
            [0,1,1,0 , 1,1,0,0 , 1,0,1,0 , 1,0,1,0]]

sample :drum_splash_hard, amp: 0.35
live_loop :beat do
  16.times do |i|
    if bar == 11
      sample :drum_cymbal_soft, sustain: 2, amp: ride1[1][i]
      sample :drum_snare_hard, amp: snare1[1][i]
      sample :drum_bass_hard, amp: kick1[1][i]
      sleep 0.25
    else
      if bar != 10
        sample :drum_cymbal_soft, sustain: 2, amp: ride[i]
        sample :drum_snare_hard, amp: snare[i]
        sample :drum_bass_hard, amp: kick[i]
        sample :drum_cymbal_pedal, amp: foot[i]/2.0
        sleep 0.25
      else
        sample :drum_cymbal_soft, sustain: 2, amp: ride1[0][i]
        sample :drum_snare_hard, amp: snare1[0][i]
        sample :drum_bass_hard, amp: kick1[0][i]
        sleep 0.25
      end
    end
  end
  bar += 1
end

sleep 8

hi_tom  = [[0,1,1,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,1,1,1 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],]

comp_sn = [[0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,1,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0]]

3.times do |i|
  16.times do |i2|
    sample :drum_tom_hi_hard, amp: hi_tom[i][i2]
    sample :drum_snare_hard, amp: comp_sn[i][i2]
    sleep 0.25
  end
end

4.times do
  sample :drum_tom_hi_hard, amp: 0.65
  sleep 0.13
end
3.times do
  sample :drum_tom_hi_hard, amp: 1
  sleep 0.25
end

sleep 2.73

hi_tom  = [[0,1,1,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,0,0,0 , 1,1,0,0 , 0,0,0,0 , 0,0,0,0]]

low_tom = [[0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 1,0,1,0]]

com2_sn = [[0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,1,0,0 , 0,0,0,0 , 1,1,1,0 , 0,0,0,0]]


2.times do |i|
  16.times do |i2|
    sample :drum_tom_hi_hard, amp: hi_tom[i][i2]
    sample :drum_tom_lo_hard, amp: low_tom[i][i2]
    sample :drum_snare_hard, amp: com2_sn[i][i2]
    
    sleep 0.25
  end
end

sample :drum_splash_hard, amp: 0.6
sleep 2.50

4.times do
  sample :drum_snare_hard, amp: rrand(0.2,0.8)
  sleep 0.13
end
3.times do
  sample :drum_snare_hard, amp: 1
  sleep 0.25
end
2.times do
  sample :drum_tom_lo_hard
  sleep 0.25
end
sleep 3.73

sleep 8
sample :drum_splash_hard, amp: 2
bass    = [[1,48],[0,0],[0,0],[1,45] , [0,0],[0,0],[1,48],[0,0],
           [1,49],[0,0],[0,0],[1,46] , [0,0],[0,0],[1,49],[0,0],
           [1,48],[0,0],[0,0],[1,45] , [0,0],[0,0],[1,48],[0,0],
           [1,46],[0,0],[0,0],[1,43] , [0,0],[0,0],[1,46],[0,0]]

live_loop :bass do
  32.times do |i|
    if bass[i][1] > 0
      synth :fm, note: (bass[i][1] -12), amp: bass[i][0]
      synth :fm, note: (bass[i][1] ), amp: bass[i][0] + 1.3
      synth :bass_foundation, note: (bass[i][1] -12), amp: bass[i][0] -0.7
      synth :bass_foundation, note: (bass[i][1] ), amp: bass[i][0] -0.7
    end
    sleep 0.25
  end
end

sleep 14
sample :drum_splash_hard, amp: 1.2

sleep 6
hi_tom  = [[0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,1,1],
           [1,1,1,1 , 0,0,0,0 , 0,0,0,0 , 0,0,1,1],
           [1,0,0,0 , 0,0,0,0 , 0,1,1,1 , 1,0,0,0]]



com2_sn = [[0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,0,0,0 , 0,0,0,0 , 0,0,0,0 , 0,0,0,0],
           [0,0,0,0 , 0,0,0,0 , 0,0,1,1 , 0,2,0,3]]


3.times do |i|
  16.times do |i2|
    sample :drum_tom_hi_hard, amp: hi_tom[i][i2]
    sample :drum_snare_hard, amp: com2_sn[i][i2]
    sleep 0.25
  end
end

sample :drum_splash_hard, amp: 1.2
piano = [[1, [40, 52,64]], [0, []], [0, []], [1, [73]],
         [0, []], [1, [72]], [0, []], [1, [73,70,65]],
         [1, [41, 53]], [1, [73]], [0, []], [1,[75]],
         [1, [73]], [0, []], [1, [72]], [0,[]]]
piano1 = [[1, [40-12, 52-12,64-12]], [0, []], [0, []], [1, [73-12]],
          [0, []], [1, [72-12]], [0, []], [1, [73-12,70-12,65-12]],
          [1, [41-12, 53-12]], [1, [73-12]], [0, []], [1,[75-12]],
          [1, [73-12]], [0, []], [1, [72-12]], [0,[]]]
live_loop :piano do
  use_synth :piano
  16.times do |i|
    if piano[i][0] == 1
      play piano[i][1]
      play piano1[i][1], amp: 0.5
    end
    sleep 0.25
  end
end

sleep 16
sample :drum_splash_hard, amp: 0.8
