/* synth.h -- Common speech synthesis related definitions and prototypes
 *
 * Copyright (C) 1990, 1991 Speech Research Laboratory, Minsk
 * Copyright (C) 2005 Igor Poretsky <poretsky@mlbox.ru>
 * Copyright (C) 2021 Boris Lobanov <lobbormef@gmail.com>
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RU_TTS_SYNTH_H
#define RU_TTS_SYNTH_H

#include <stdint.h>
#include <stdlib.h>

#include "transcription.h"
#include "soundscript.h"
#include "voice.h"
#include "sink.h"


/* TTS control data structure */
typedef struct
{
  transcription_state_t transcription_state;
  sink_t wave_consumer;
  const voice_t *voice;

  /* Speechrate parameters */
  uint8_t rate_factor;
  uint8_t stretch;
  uint8_t gaplen;

  /* Intonation control */
  uint16_t mintone;
  uint16_t maxtone;
} ttscb_t;


/* Available voices */
extern const voice_t male;
extern const voice_t female;


/* Function prototypes */

/* Build utterance according to phonetic transcription */
extern void build_utterance(uint8_t *transcription, soundscript_t *script);

/*
 * Examine phonetic transcription and apply speechrate parameters
 * to the corresponding soundscript.
 */
extern void apply_speechrate(uint8_t *transcription, soundscript_t *script,
                             uint8_t rate_factor, uint8_t stretch, uint8_t gaplen);

/* Apply intonation parameters to the sound script */
extern void apply_intonation(uint8_t *transcription, soundscript_t *soundscript,
                             uint16_t mintone, uint16_t maxtone, uint8_t clause_type);

/* Generate sound stream and feed it to the specified sink */
extern void make_sound(soundscript_t *script, sink_t *consumer);

/* Synthesize speech chunk by chunk for specified phonetic transcription */
extern void synth(uint8_t *transcription, ttscb_t *ttscb);

#endif
