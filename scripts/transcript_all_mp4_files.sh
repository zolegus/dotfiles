#!/bin/bash
program1="ffmpeg"
params1="-ar 16000 -ac 1 -c:a pcm_s16le"
program2="whisper-cpp"
params2="-m /Users/zolegus/dev/whisper/whisper.cpp/models/ggml-base.en.bin --output-srt"

for file in *.mp4; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        filename_no_ext="${filename%.*}"
        # Check if there exists a corresponding .srt file with the same name
        srt_file="${filename_no_ext}.srt"
        if [ -e "$srt_file" ]; then
            echo "Skipping $mp4_file because $srt_file exists."
            continue
        fi
        echo "Running $program1 with $params1 on file: $file"
        "$program1" -i "$file" $params1 "$filename_no_ext.wav"
        if [ $? -eq 0 ]; then
            echo "Running $program2 with $params2 on file: $filename_no_ext"
            "$program2" $params2 --output-file "$filename_no_ext" -f "$filename_no_ext.wav"
        else
            echo "Error..."
        fi
        echo "Removing temporary files"
        rm "$filename_no_ext.wav"
    fi
done

