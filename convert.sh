for outfit in generated/*; do
	outfit_name=$(basename ${outfit})

	for body in generated/${outfit_name}/*; do
		body_name=$(basename ${body})

		for eyes in generated/${outfit_name}/${body_name}/*; do
			eyes_name=$(basename ${eyes})

			for faces in generated/${outfit_name}/${body_name}/${eyes_name}/*; do
				faces_name=$(basename -s .svg ${faces})

				output="generated/${outfit_name}/${body_name}/${eyes_name}/${faces_name}.png"

				svgexport $faces $output 8x

				rm $faces
			done
		done
	done
done
