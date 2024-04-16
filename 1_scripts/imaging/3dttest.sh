{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "3dttest++ -prefix test_fb_gain_rpe -mask $mask_dset -setA '501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '502_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]'-setB '401_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '402_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]'"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "3dttest++ -prefix test_fb_gain_rpe #\n",
    "-mask $mask_dset #\n",
    "-setA #\n",
    "'501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' #\n",
    "'502_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' #\n",
    "-setB #\n",
    "'401_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' #\n",
    "'402_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' #"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "3dttest++ -prefix HC-MDD_fb_gain_rpe \n",
    "-mask $mask_dset  \\\n",
    "-setA  \\\n",
    "'501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' \\\n",
    "'502_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' \\\n",
    "-setB \\\n",
    "'401_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' \\\n",
    "'402_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' \\"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "3dttest++ -prefix test2_fb_gain_rpe -mask first_level_mask_rs.nii -setA '501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '502_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '503_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '504_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '506_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '507_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '512_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '514_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '515_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '516_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '517_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '519_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '520_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '521_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '522_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '523_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '524_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '525_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '526_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '527_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '530_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '531_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '532_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '533_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '535_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '536_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '537_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '538_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '542_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '543_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '544_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '545_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '546_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '547_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '548_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '549_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' -setB '401_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '402_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '408_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '409_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '410_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '413_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '415_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '416_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '417_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '418_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '419_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '420_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '421_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '422_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '423_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '424_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '425_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '427_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '428_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '430_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '431_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '432_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '434_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '435_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '436_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '440_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '438_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '442_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '444_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '445_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '446_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '447_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '443_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '450_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '451_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '453_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '454_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '455_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]'"
   ]
  }
 ],
 "metadata": {
  "language_info": {
   "name": "python"
  },
  "orig_nbformat": 4
 },
 "nbformat": 4,
 "nbformat_minor": 2
}

## HC - MDD gain rpe
3dttest++ -prefix HC-MDD_fb_gain_rpe -mask first_level_mask_rs.nii -Clustsim -prefix_clustsim cc -setA '501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '502_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '503_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '504_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '506_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '507_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '512_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '514_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '515_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '516_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '517_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '519_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '520_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '521_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '522_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '523_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '524_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '525_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '526_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '527_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '530_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '531_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '532_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '533_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '535_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '536_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '537_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '538_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '542_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '543_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '544_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '545_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '546_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '547_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '548_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '549_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' -setB '401_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '402_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '408_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '409_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '410_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '413_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '415_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '416_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '417_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '418_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '419_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '420_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '421_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '422_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '423_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '424_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '425_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '427_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '428_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '430_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '431_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '432_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '434_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '435_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '436_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '440_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '438_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '442_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '444_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '445_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '446_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '447_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '443_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '450_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '451_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '453_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '454_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '455_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' -overwrite

## HC - MDD loss rpe
3dttest++ -prefix HC-MDD_fb_loss_rpe -mask first_level_mask_rs.nii -setA '501_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '502_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '503_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '504_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '506_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '507_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '512_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '514_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '515_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '516_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '517_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '519_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '520_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '521_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '522_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '523_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '524_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '525_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '526_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '527_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '530_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '531_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '532_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '533_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '535_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '536_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '537_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '538_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '542_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '543_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '544_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '545_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '546_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '547_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '548_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '549_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' -setB '401_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '402_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '408_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '409_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '410_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '413_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '415_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '416_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '417_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '418_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '419_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '420_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '421_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '422_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '423_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '424_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '425_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '427_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '428_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '430_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '431_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '432_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '434_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '435_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '436_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '440_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '438_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '442_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '444_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '445_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '446_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '447_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '443_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '450_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '451_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '453_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '454_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' '455_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]' -overwrite

## stim gain-loss (warning of constants)
3dttest++ -prefix HC-MDD_stim_gain-loss -setA '501_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '502_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '503_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '504_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '506_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '507_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '512_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '514_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '515_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '516_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '517_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '519_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '520_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '521_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '522_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '523_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '524_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '525_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '526_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '527_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '530_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '531_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '532_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '533_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '535_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '536_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '537_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '538_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '542_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '543_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '544_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '545_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '546_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '547_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '548_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '549_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' -setB '401_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '402_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '408_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '409_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '410_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '413_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '415_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '416_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '417_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '418_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '419_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '420_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '421_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '422_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '423_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '424_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '425_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '427_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '428_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '430_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '431_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '432_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '434_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '435_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '436_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '440_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '438_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '442_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '444_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '445_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '446_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '447_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '443_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '450_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '451_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '453_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '454_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' '455_RP_firstlevel_cond_rpe+tlrc[stim_gain-loss_GLT#0_Coef]' -overwrite

## stim gain neutral


# coef 0, feedback_gain_rpe
3dttest++ -prefix HC-MDD_fb_gain_rpe  \
-mask $mask_dset  \
-setA  \
'501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'502_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'503_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'504_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'506_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'507_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'512_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'514_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'515_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'516_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'517_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'519_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'520_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'521_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'522_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'523_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'524_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'525_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'526_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'527_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'530_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'531_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'532_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'533_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'535_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'536_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'537_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'538_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'542_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'543_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'544_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'545_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'546_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'547_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'548_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'549_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
-setB  \
'401_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'402_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'408_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'409_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'410_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'413_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'415_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'416_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'417_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'418_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'419_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'420_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'421_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'422_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'423_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'424_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'425_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'427_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'428_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'430_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'431_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'432_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'434_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'435_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'436_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'440_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'438_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'442_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'444_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'445_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'446_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'447_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'443_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'450_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'451_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'453_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'454_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
'455_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#0_Coef]' \
-overwrite

# punishment PE
# coef 0 [this is not amplitude modulated, just the mean]
3dttest++ -prefix HC-MDD_fb_loss_rpe  \
-setA  \
'501_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'502_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'503_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'504_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'506_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'507_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'512_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'514_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'515_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'516_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'517_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'519_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'520_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'521_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'522_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'523_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'524_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'525_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'526_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'527_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'530_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'531_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'532_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'533_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'535_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'536_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'537_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'538_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'542_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'543_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'544_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'545_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'546_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'547_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'548_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'549_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
-setB  \
'401_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'402_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'408_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'409_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'410_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'413_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'415_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'416_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'417_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'418_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'419_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'420_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'421_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'422_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'423_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'424_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'425_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'427_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'428_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'430_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'431_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'432_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'434_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'435_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'436_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'440_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'438_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'442_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'444_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'445_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'446_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'447_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'443_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'450_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'451_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'453_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'454_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
'455_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#0_Coef]' \
-overwrite

3dttest++ -prefix all_rpe_test -mask first_level_mask_rs.nii -setA '501_RP_firstlevel_cond_rpe+tlrc[feedback_gain_rpe#1_Coef]' '501_RP_firstlevel_cond_rpe+tlrc[feedback_loss_rpe#1_Coef]'