Expectation-Maximisation Algorithm by Esther Alberts

Dockerfile to create a new image from the Source Code at Bitbucket

Version: 0.0
Functional: No
Author: Christoph Berger

Docker Command: docker run -v $(pwd):/data --workdir=/usr/src/app -i -t cberger/em_final python main.py

Usage: In the directory containing a folder "Input" with the subfolders "preprocessed_data" (containing T1, T1c, T2, FLAIR and Flair_Mask) and "registered_atlas" (containing csf, grey, white), run the image with the following command:
docker run -v $(pwd):/data --workdir=/usr/src/app -i -t cberger/em_final python main.py
The output is written to /data/Results/ in the current folder on the host.
More options coming soon.

Based on the Expectation-Maximisation Algorithm of Esther Alberts.
For full instructions and licensing, see: https://bitbucket.org/s0216660/brain_tumor_segmentation_em
