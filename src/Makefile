PROJ=fvad

EMCCFLAGS=-s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s MAXIMUM_MEMORY=4GB -s MALLOC='emmalloc' -D MFCC_INPUT_FLOAT32=1 -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_fvad_new', '_fvad_free', '_fvad_reset', '_fvad_set_mode', '_fvad_set_sample_rate', '_fvad_process']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -s EXPORT_NAME="${PROJ}"

fvad: signal_processing/energy.c signal_processing/division_operations.c signal_processing/get_scaling_square.c signal_processing/resample_48khz.c signal_processing/resample_by_2_internal.c signal_processing/resample_fractional.c signal_processing/spl_inl.c vad/vad_core.c vad/vad_filterbank.c vad/vad_gmm.c vad/vad_sp.c fvad.c
	emcc $(EMCCFLAGS) -O3 -o $(PROJ).cjs $^

.PHONY: clean
clean:
	rm -f $(PROJ).cjs $(PROJ).wasm
