PROJ=fvad

EMCCFLAGS=-s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_fvad_new', '_fvad_free', '_fvad_reset', '_fvad_set_mode', '_fvad_set_sample_rate', '_fvad_process']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -s EXPORT_ES6=1 -s EXPORT_NAME="${PROJ}"

fvad: src/signal_processing/energy.c src/signal_processing/division_operations.c src/signal_processing/get_scaling_square.c src/signal_processing/resample_48khz.c src/signal_processing/resample_by_2_internal.c src/signal_processing/resample_fractional.c src/signal_processing/spl_inl.c src/vad/vad_core.c src/vad/vad_filterbank.c src/vad/vad_gmm.c src/vad/vad_sp.c src/fvad.c
	emcc $(EMCCFLAGS) -O3 -o $(PROJ).js $^

.PHONY: clean
clean:
	rm -f $(PROJ).js $(PROJ).wasm
