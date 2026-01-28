package com.smbtv.ui.components;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.leanback.widget.Presenter;
import androidx.core.content.ContextCompat;
import androidx.cardview.widget.CardView;
import android.util.Log;
import android.view.ViewGroup;

import com.smbtv.R;


public class MenuItemPresenter extends Presenter {

    private static final String TAG = MenuItemPresenter.class.getName();

    private static final int IMAGE_WIDTH = 350;
    private static final int IMAGE_HEIGHT = 400;

    private Drawable mDefaultCardImage;

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent) {

        Log.d(TAG, "onCreateViewHolder");

        final Context context = parent.getContext();
        
        // Create a card view with icon and text
        CardView cardView = new CardView(context);
        cardView.setCardElevation(8);
        cardView.setRadius(8);
        
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setLayoutParams(new ViewGroup.LayoutParams(IMAGE_WIDTH, IMAGE_HEIGHT));
        
        ImageView imageView = new ImageView(context);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(IMAGE_WIDTH, IMAGE_WIDTH));
        imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        
        TextView titleView = new TextView(context);
        titleView.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        titleView.setTextSize(16);
        titleView.setMaxLines(1);
        
        TextView detailView = new TextView(context);
        detailView.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        detailView.setTextSize(12);
        detailView.setMaxLines(1);
        
        layout.addView(imageView);
        layout.addView(titleView);
        layout.addView(detailView);
        cardView.addView(layout);

        cardView.setFocusable(true);
        cardView.setFocusableInTouchMode(true);

        return new ViewHolder(cardView);
    }

    @Override
    public void onBindViewHolder(Presenter.ViewHolder viewHolder, Object item) {

        Log.d(TAG, "onBindViewHolder");

        if (!(item instanceof MenuItem)) {

            throw new IllegalArgumentException("item must be instance of MenuItem, not " + item.getClass().getName());
        }

        MenuItem menuItem = (MenuItem) item;
        
        CardView cardView = (CardView) viewHolder.view;
        LinearLayout layout = (LinearLayout) cardView.getChildAt(0);
        
        ImageView imageView = (ImageView) layout.getChildAt(0);
        TextView titleView = (TextView) layout.getChildAt(1);
        TextView detailView = (TextView) layout.getChildAt(2);
        
        titleView.setText(menuItem.getTitle());
        detailView.setText(menuItem.getDetail());

        final Context context = cardView.getContext();
        final Drawable icon = ContextCompat.getDrawable(context, menuItem.getIcon());
        imageView.setImageDrawable(icon);
    }

    @Override
    public void onUnbindViewHolder(Presenter.ViewHolder viewHolder) {

        Log.d(TAG, "onUnbindViewHolder");
    }
}
