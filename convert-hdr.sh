set -eu

for outfit in converted-png/*; do
	outfit_name=$(basename ${outfit})

	for body in converted-png/${outfit_name}/*; do
		body_name=$(basename ${body})

		for eyes in converted-png/${outfit_name}/${body_name}/*; do
			eyes_name=$(basename ${eyes})

			mkdir -p "converted-png-hdr/${outfit_name}/${body_name}/${eyes_name}"

			for faces in converted-png/${outfit_name}/${body_name}/${eyes_name}/*; do
				faces_name=$(basename -s .png ${faces})

				output="converted-png-hdr/${outfit_name}/${body_name}/${eyes_name}/${faces_name}.png"

				if [ -f $faces ] && [ ! -f $output ]; then
					ffmpeg -i $faces -vf format=rgba64le,zscale=m=2020_ncl:t=arib-std-b67:p=2020:c=topleft,exposure=exposure=0.3 $output
				fi
			done
		done
	done
done
