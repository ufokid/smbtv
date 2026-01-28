package com.smbtv.ui.fragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.smbtv.databinding.FragmentMainBinding;

/**
 * Exemplo de Fragment moderno com View Binding
 * Use este padrão para criar novos Fragments
 */
public class ModernFragmentExample extends Fragment {

    private FragmentMainBinding binding;

    @Override
    public View onCreateView(
            @NonNull LayoutInflater inflater,
            @Nullable ViewGroup container,
            @Nullable Bundle savedInstanceState) {
        
        // Initialize binding
        binding = FragmentMainBinding.inflate(inflater, container, false);
        return binding.getRoot();
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        
        // Setup UI components here
        setupUI();
    }

    /**
     * Setup UI components and listeners
     */
    private void setupUI() {
        // TODO: Initialize your UI components here
        // binding.someButton.setOnClickListener(v -> {
        //     // Handle click
        // });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}